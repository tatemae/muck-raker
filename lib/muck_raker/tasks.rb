require 'rake'
require 'rake/tasklib'
require 'fileutils'

module MuckRaker
  class Tasks < ::Rake::TaskLib
    def initialize
      ENV['DEBUG'] = 'true' unless ENV['DEBUG'] == 'false'
      ENV['RAILS_ENV'] = 'development' unless ENV['RAILS_ENV']
      define
    end

    private
    def define

      namespace :muck do

        namespace :raker do

          desc "Imports attention data for use in testing"
          task :import_attention => :environment do
            require 'active_record/fixtures'
            ActiveRecord::Base.establish_connection(RAILS_ENV.to_sym)
            yml = File.join(RAILS_ROOT, 'db', 'bootstrap', 'attention')
            Fixtures.new(Attention.connection,"attention",Attention,yml).insert_fixtures
          end

          desc "Sync files from muck raker."
          task :sync do
            path = File.join(File.dirname(__FILE__), *%w[.. ..])
            system "rsync -ruv #{path}/db ."
            system "rsync -ruv #{path}/config/solr ./config"
            system "rsync -ruv #{path}/config/solr.yml ./config" if !File.exist?('.config/solr.yml')
            system "rsync -ruv #{path}/config/initializers/muck_raker.rb ./config/initializers" if !File.exist?('.config/initializsers/muck_raker.rb')
          end

          def reload_cores
            ['en', 'es', 'zh-CN', 'fr', 'ja', 'de', 'ru', 'nl'].each{|core|
              Net::HTTP.new('127.0.0.1', SOLR_PORT).request_head('/solr/admin/cores?action=RELOAD&core=' + core).value
            }
          end

          desc "Reload solr indexes used by muck-raker."
          task :reload_indexes do
            require File.expand_path("#{File.dirname(__FILE__)}/../../config/muck_raker_environment")
            reload_cores            
          end

          def show_options
            puts "RAILS_ENV=#{ENV['RAILS_ENV']} "
            puts "solr.solr.home=\"#{SOLR_CONFIG_PATH}\" "
            puts "solr.data.dir=\"#{SOLR_DATA_PATH}\""
            puts "RAKER_PIDS_PATH=\"#{RAKER_PIDS_PATH}\" "
            puts "recommender.database.config_file=\"#{RAKER_DATABASE_CONFIG_FILE}\" "
            puts "recommender.log_file=\"#{RAKER_LOGS_PATH}/raker.log\" "
            puts "recommender.log_to_console=\"#{ENV['DEBUG']}\" "
            puts "aggregator.feed_archive_path=\"#{RAKER_FEED_ARCHIVE_PATH}\" "
          end

          def daemon_task task = 'all', task_param = nil
            require File.expand_path("#{File.dirname(__FILE__)}/../../config/muck_raker_environment")
            task_param ||= (ENV['redo'] == 'true') ? 'redo' : ''
            FileUtils.mkdir_p(RAKER_PIDS_PATH)
            FileUtils.mkdir_p(RAKER_LOGS_PATH)
            FileUtils.mkdir_p(RAKER_FEED_ARCHIVE_PATH)
            show_options
            options = "-DRAILS_ENV=#{ENV['RAILS_ENV']} "
            options << "-DDEBUG=#{ENV['DEBUG']} "
            options << "-Dsolr.solr.home=\"#{SOLR_CONFIG_PATH}\" "
            options << "-Dsolr.data.dir=\"#{SOLR_DATA_PATH}\" "
            options << "-Drecommender.database.config_file=\"#{RAKER_DATABASE_CONFIG_FILE}\" "
            options << "-Drecommender.log_file=\"#{RAKER_LOGS_PATH}/raker.log\" "
            options << "-Drecommender.log_to_console=\"#{ENV['DEBUG']}\" "
            options << "-Daggregator.feed_archive_path=\"#{RAKER_FEED_ARCHIVE_PATH}\" "
            javaclass = "edu.usu.cosl.recommenderd.Recommenderd "
            separator = (RUBY_PLATFORM =~ /(win|w)32$/ ? ';' : ':')
            Dir.chdir(File.join(File.dirname(__FILE__), '../../', 'raker', 'lib')) do
              jars = Dir['*.jar','solr/*.jar'].join(separator)
              classpath = "-classpath #{jars}#{separator}. "
              cmd = "nice -n 2 java " + options + classpath + javaclass + task + ' ' + task_param
              puts ("Executing: " + cmd)
              windows = RUBY_PLATFORM =~ /(win|w)32$/
              if windows
               exec cmd
              else
                pid = fork do
                  exec cmd
                end
              end
              sleep(5)
              File.open("#{RAKER_PIDS_PATH}/#{ENV['RAILS_ENV']}_pid", "w"){ |f| f << pid} unless windows
              puts "#{ENV['RAILS_ENV']} Muck raker command started successfully, pid: #{pid}."
            end
          end

          desc "Start daemon."
          task :start => :environment do
            daemon_task 'daemon'
          end

          desc "Redo everything once and quit."
          task :start_redo => :environment do
            daemon_task 'daemon', 'redo'
          end

          desc "Harvest stale feeds. Add redo=true to harvest all feeds."
          task :harvest => :environment do
            daemon_task 'harvest'
          end

          desc "Index new entries."
          task :index => :environment do
            daemon_task 'index'
          end

          desc "Re-index all entries."
          task :index_redo => :environment do
            daemon_task 'index', 'redo'
          end

          desc "Update recommendations."
          task :recommend => :environment do
            daemon_task 'recommend'
          end

          desc "Redo all recommendations."
          task :recommend_redo => :environment do
            daemon_task 'recommend', 'redo'
          end

          desc "Auto-generate tags for new entries that don't have at least 4. Add redo=true to regenerate for all entries."
          task :subjects => :environment do
            daemon_task 'subjects'
          end

          desc "Re-generate tag clouds."
          task :tag_clouds => :environment do
            daemon_task 'tag_clouds', 'redo'
          end

          desc "Stop a raker daemon process."
          task :stop => :environment do
            file_path = "#{RAKER_PIDS_PATH}/#{ENV['RAILS_ENV']}_pid"
            if File.exists?(file_path)
              File.open(file_path, "r") do |f|
                pid = f.readline
                Process.kill('TERM', pid.to_i)
              end
              File.unlink(file_path)
              puts "Raker shutdown successfully."
            else
              puts "PID file not found at #{file_path}. Either Raker is not running or no PID file was written."
            end
          end

        end

      end

    end
  end
end
MuckRaker::Tasks.new
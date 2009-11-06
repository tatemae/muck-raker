require 'rake'
require 'rake/tasklib'
require 'fileutils'

module MuckRaker
  class Tasks < ::Rake::TaskLib
    def initialize
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

          namespace :db do

            desc "Flags the languages that the muck raker supports"
            task :populate => :environment do
              require 'active_record/fixtures'
              ['en', 'es', 'zh-CN', 'fr', 'ja', 'de', 'ru', 'nl'].each{|l|
                r = Language.first(:one, :conditions => "locale = '#{l}'")
                if r
                  r.update_attribute(:muck_raker_supported, true)
                else
                  puts "Unable to find languages to flag. You probably need to run rake muck:db:populate"
                  break
                end
              }
            end
            
            desc "Loads some feeds oai endpoints to get things started"
            task :bootstrap => :environment do
              require 'active_record/fixtures'
              ActiveRecord::Base.establish_connection(RAILS_ENV.to_sym)

              # import the bootstrap db entries
              OaiEndpoint.delete_all
              yml = File.join(File.dirname(__FILE__), '..', '..', 'db', 'bootstrap',"oai_endpoints")
              Fixtures.new(OaiEndpoint.connection,"oai_endpoints",OaiEndpoint,yml).insert_fixtures

              Feed.delete_all
              yml = File.join(File.dirname(__FILE__), '..', '..', 'db', 'bootstrap',"feeds")
              Fixtures.new(Feed.connection,"feeds",Feed,yml).insert_fixtures

              ServiceCategory.delete_all
              yml = File.join(File.dirname(__FILE__), '..', '..', 'db', 'bootstrap',"service_categories")
              Fixtures.new(Service.connection,"service_categories",ServiceCategory,yml).insert_fixtures
              
              Service.delete_all
              yml = File.join(File.dirname(__FILE__), '..', '..', 'db', 'bootstrap',"services")
              Fixtures.new(Service.connection,"services",Service,yml).insert_fixtures

            end

            desc "Deletes and reloads all services and service categories"
            task :bootstrap_services => :environment do
              require 'active_record/fixtures'
              ActiveRecord::Base.establish_connection(RAILS_ENV.to_sym)

              ServiceCategory.delete_all
              yml = File.join(File.dirname(__FILE__), '..', '..', 'db', 'bootstrap',"service_categories")
              Fixtures.new(Service.connection,"service_categories",ServiceCategory,yml).insert_fixtures
              
              Service.delete_all
              yml = File.join(File.dirname(__FILE__), '..', '..', 'db', 'bootstrap',"services")
              Fixtures.new(Service.connection,"services",Service,yml).insert_fixtures
            end
            
          end
 
          desc "Sync files from muck raker."
          task :sync do
            path = File.join(File.dirname(__FILE__), *%w[.. ..])
            system "rsync -ruv #{path}/db ."
            system "rsync -ruv #{path}/public ."
            system "rsync -ruv #{path}/config/solr ./config"
          end

          def pid_file
            "#{RAKER_PIDS_PATH}/#{ENV['RAILS_ENV']}_pid"
          end

          def raker_task task = 'daemon', param = ''
            require File.expand_path("#{File.dirname(__FILE__)}/../../config/muck_raker_environment")
            show_options
            FileUtils.mkdir_p(RAKER_PIDS_PATH)
            FileUtils.mkdir_p(RAKER_LOGS_PATH)
            separator = (RUBY_PLATFORM =~ /(win|w)32$/ ? ';' : ':')
            puts "RAILS_ENV=" + ENV['RAILS_ENV']
            Dir.chdir(File.join(File.dirname(__FILE__), '../../', 'raker', 'lib')) do
              jars = Dir['*.jar','solr/*.jar'].join(separator)
              options = "-DRAILS_ENV=#{ENV['RAILS_ENV']} "
              options << "-Dsolr.solr.home=\"#{SOLR_CONFIG_PATH}\" "
              options << "-Dsolr.data.dir=\"#{SOLR_DATA_PATH}\" "
              options << "-Draker.database.config=\"#{RAKER_DATABASE_CONFIG}\" " 
              options << "-Draker.log.dir=\"#{RAKER_LOGS_PATH}\" "
              options << "-Draker.feed_archive_dir=\"#{RAKER_FEED_ARCHIVE_PATH}\" "
              options << "-Draker.log_to_console=\"#{RAKER_LOG_TO_CONSOLE}\" "
              classpath = "-classpath #{jars}#{separator}. "
              memory_options = "-Xms32m -Xmx128m "
              javaclass = "edu.usu.cosl.recommenderd.Recommenderd "
              cmd = "java " + options + classpath + memory_options + javaclass + task + " " + param
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
              File.open(pid_file, "w"){ |f| f << pid} unless windows
              puts "#{ENV['RAILS_ENV']} Muck raker harvest command started successfully, pid: #{pid}."
            end
          end
          
          def show_options
            puts "RAILS_ENV=#{ENV['RAILS_ENV']} "
            puts "solr.solr.home=\"#{SOLR_CONFIG_PATH}\" "
            puts "solr.data.dir=\"#{SOLR_DATA_PATH}\" "
            puts "raker.db.config=\"#{RAKER_DATABASE_CONFIG}\" " 
            puts "raker.log.dir=\"#{RAKER_LOGS_PATH}\" "
            puts "raker.feed_archive_dir=\"#{RAKER_FEED_ARCHIVE_PATH}\" "
            puts "raker.log_to_console=\"#{RAKER_LOG_TO_CONSOLE}\" "
          end
          
          desc "Print out muck raker dependent environment variables"
          task :show_options => :environment do
            require File.expand_path("#{File.dirname(__FILE__)}/../../config/muck_raker_environment")
            show_options
          end

          desc "Start the recommender daemon process"
          task :start => :environment do
            raker_task
          end

          desc "Redo everything (re-index, redo autogenerated subjects, rebuild tag clouds re-recommend)"
          task :rebuild => :environment do
            raker_task 'daemon', 'full'
          end

          desc "Get some data into the recommender system"
          task :bootstrap => :environment do
            raker_task 'bootstrap'
          end

          desc "Harvest without recommending"
          task :harvest => :environment do
            raker_task 'harvest'
          end

          desc "Update solr index to changes made to recommender database"
          task :index => :environment do
            raker_task 'index'
          end

          desc "Recommend without harvesting"
          task :recommend => :environment do
            raker_task 'recommend'
          end

          desc "Redo recommendations only"
          task :redo_recommendations => :environment do
            raker_task 'recommend', 'full'
          end

          desc "Autogenerate subjects"
          task :subjects => :environment do
            raker_task 'auto_generate_subjects'
          end

          desc "Generate tag clouds"
          task :tag_clouds => :environment do
            raker_task 'tag_clouds'
          end

          desc "Stop a raker daemon process"
          task :stop => :environment do
            file_path = pid_file 
            if File.exists?(file_path)
              File.open(file_path, "r") do |f|
                pid = f.readline
                Process.kill('TERM', pid.to_i)
              end
              File.unlink(file_path)
              puts "Raker task successfully."
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
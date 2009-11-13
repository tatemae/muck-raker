ENV['RAILS_ENV'] = (ENV['RAILS_ENV'] || 'development').dup

SOLR_PATH = "#{RAILS_ROOT}/config/solr" unless defined? SOLR_PATH

unless defined? SOLR_LOGS_PATH
  SOLR_LOGS_PATH = ENV["SOLR_LOGS_PATH"] || "#{RAILS_ROOT}/log"
end
unless defined? SOLR_PIDS_PATH
  SOLR_PIDS_PATH = ENV["SOLR_PIDS_PATH"] || "#{RAILS_ROOT}/tmp/pids/solr"
end
unless defined? SOLR_DATA_PATH
  SOLR_DATA_PATH = ENV["SOLR_DATA_PATH"] || "#{RAILS_ROOT}/solr/#{ENV['RAILS_ENV']}"
end
unless defined? SOLR_CONFIG_PATH
  SOLR_CONFIG_PATH = ENV["SOLR_CONFIG_PATH"] || SOLR_PATH
end

unless defined? RAKER_LOGS_PATH
  RAKER_LOGS_PATH = ENV["RAKER_LOGS_PATH"] || "#{RAILS_ROOT}/log"
end
unless defined? RAKER_PIDS_PATH
  RAKER_PIDS_PATH = ENV["RAKER_PIDS_PATH"] || "#{RAILS_ROOT}/tmp/pids/raker"
end
unless defined? RAKER_FEED_ARCHIVE_PATH
  if ENV['RAILS_ENV'] == 'production'
    RAKER_FEED_ARCHIVE_PATH = File.join(RAILS_ROOT, '..', '..', 'shared', 'feed_archive')
  elsif ENV['RAILS_ENV'] == 'development'
    RAKER_FEED_ARCHIVE_PATH = File.join(RAILS_ROOT, '..', 'feed_archive')
  end
end
unless defined? RAKER_DATABASE_CONFIG_FILE
  if ENV['RAILS_ENV'] == 'production'
    RAKER_DATABASE_CONFIG_FILE = File.join(RAILS_ROOT, '..', '..', 'shared', 'config', 'database.yml')
  else
    RAKER_DATABASE_CONFIG_FILE = File.join(RAILS_ROOT, 'config', 'database.yml')
  end
end


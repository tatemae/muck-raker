ENV['RAILS_ENV'] = (ENV['RAILS_ENV'] || 'development').dup

unless defined? SOLR_LOGS_PATH
  SOLR_LOGS_PATH = ENV["SOLR_LOGS_PATH"] || "#{RAILS_ROOT}/log"
end
unless defined? SOLR_PIDS_PATH
  SOLR_PIDS_PATH = ENV["SOLR_PIDS_PATH"] || "#{RAILS_ROOT}/tmp/pids/solr"
end
unless defined? SOLR_DATA_PATH
  SOLR_DATA_PATH = ENV["SOLR_DATA_PATH"] || "#{RAILS_ROOT}/solr_indexes/#{ENV['RAILS_ENV']}"
end
unless defined? SOLR_CONFIG_PATH
  SOLR_CONFIG_PATH = ENV["SOLR_CONFIG_PATH"] || File.join(RAILS_ROOT, 'config', 'solr')
end

unless defined? RAKER_LOG_FILE
  RAKER_LOG_FILE = File.join(RAILS_ROOT, 'log', 'recommenderd.log')
end
unless defined? RAKER_PIDS_PATH
  RAKER_PIDS_PATH = ENV["RAKER_PIDS_PATH"] || "#{RAILS_ROOT}/tmp/pids/raker"
end
unless defined? RAKER_FEED_ARCHIVE_PATH
  if ENV['RAILS_ENV'] == 'production'
    RAKER_FEED_ARCHIVE_PATH = File.join(RAILS_ROOT, '..', '..', 'shared', 'feed_archive')
  else
    RAKER_FEED_ARCHIVE_PATH = File.join(RAILS_ROOT, '..', 'feed_archive')
  end
end
unless defined? RAKER_DATABASE_CONFIG
  if ENV['RAILS_ENV'] == 'production'
    RAKER_DATABASE_CONFIG = File.join(RAILS_ROOT, '..', '..', 'shared', 'config', 'database.yml')
  else
    RAKER_DATABASE_CONFIG = File.join(RAILS_ROOT, 'config', 'database.yml')
  end
end
unless defined? RAKER_LOG_TO_CONSOLE
  if ENV['RAILS_ENV'] == 'production'
    RAKER_LOG_TO_CONSOLE = 'false'
  else
    RAKER_LOG_TO_CONSOLE = 'true'
  end
end

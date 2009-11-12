require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'muck_raker/tasks'


desc 'Test muck-raker.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test/rails_root/test'
  t.pattern = 'test/rails_root/test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the recommender plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Recommender'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "muck-raker"
    gemspec.summary = "The aggregation and recommendation daemons for the muck system"
    gemspec.email = "justin@tatemae.com"
    gemspec.homepage = "http://github.com/tatemae/muck-raker"
    gemspec.description = "The aggregation and recommendation daemons for the muck system."
    gemspec.authors = ["Joel Duffin Justin Ball"]
    gemspec.rubyforge_project = 'muck-raker'
    gemspec.files.exclude "public/images/service_icons/source/*"
    gemspec.files.exclude "test/*"
    gemspec.test_files.exclude 'test/feed_archive/**'
  end
  Jeweler::RubyforgeTasks.new do |rubyforge|
    rubyforge.doc_task = "rdoc"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end
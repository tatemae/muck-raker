require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Test muck-raker.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test/test'
  t.pattern = 'test/test/**/*_spec.rb'
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
  Jeweler::Tasks.new do |gem|
    gem.name = "muck-raker"
    gem.summary = "The aggregation and recommendation daemons for the muck system"
    gem.email = "justin@tatemae.com"
    gem.homepage = "http://github.com/tatemae/muck-raker"
    gem.description = "The aggregation and recommendation daemons for the muck system."
    gem.authors = ["Joel Duffin Justin Ball"]
    
    gem.files.exclude "public/images/service_icons/source/*"
    gem.files.exclude 'test/**'
    gem.test_files.exclude 'test/feed_archive/**'
    gem.test_files.exclude 'test/**'
  end
  Jeweler::RubyforgeTasks.new do |rubyforge|
    rubyforge.doc_task = "rdoc"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end
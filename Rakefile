# Rakefile
require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('ruby-bigquery-cl', '0.2.0') do |p|
  p.description    = "Client for Google BigQuery service"
  p.url            = "http://github.com/boo-box/ruby-bigquery-cl"
  p.author         = "boo-box"
  p.email          = "douglas@boo-box.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }

# init.rb
require 'lib/ruby-bigquery-cl.rb'

namespace :spec do
  desc "Run all specs"
  Spec::Rake::SpecTask.new('spec') do |t|
    t.spec_files = FileList['spec/**/*_spec.rb']
    t.spec_opts = ['--options', 'spec/spec.opts']
  end
end

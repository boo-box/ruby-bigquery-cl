require 'bundler'
Bundler.setup(:default, :test)

Bundler::GemHelper.install_tasks

# Bundler don't require rspec rake task
require 'spec/rake/spectask'

Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ['--options', 'spec/spec.opts']
end

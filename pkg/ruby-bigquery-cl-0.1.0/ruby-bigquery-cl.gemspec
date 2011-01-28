# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ruby-bigquery-cl}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Douglas Rafael Roeder"]
  s.date = %q{2011-01-28}
  s.description = %q{Client for Google BigQuery service}
  s.email = %q{douglasroeder@gmail.com}
  s.extra_rdoc_files = ["README.rdoc", "README.txt", "lib/ruby-bigquery-cl.rb", "lib/ruby-bigquery-cl/http.rb", "lib/ruby-bigquery-cl/query.rb"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "README.txt", "Rakefile", "lib/ruby-bigquery-cl.rb", "lib/ruby-bigquery-cl/http.rb", "lib/ruby-bigquery-cl/query.rb", "test/test_helper.rb", "test/test_ruby-bigquery-cl.rb", "Manifest", "ruby-bigquery-cl.gemspec"]
  s.homepage = %q{http://github.com/mandrakez/ruby-bigquery-cl}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Ruby-bigquery-cl", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{ruby-bigquery-cl}
  s.rubygems_version = %q{1.4.1}
  s.summary = %q{Client for Google BigQuery service}
  s.test_files = ["test/test_helper.rb", "test/test_ruby-bigquery-cl.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

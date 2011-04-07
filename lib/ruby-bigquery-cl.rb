require 'rubygems'
require 'net/http'
require 'net/https'
require 'cgi'
require 'json'

require File.join(File.expand_path(File.dirname(__FILE__)), 'ruby-bigquery-cl', 'http')
require File.join(File.expand_path(File.dirname(__FILE__)), 'ruby-bigquery-cl', 'big_query')
require File.join(File.expand_path(File.dirname(__FILE__)), 'ruby-bigquery-cl', 'query')
require File.join(File.expand_path(File.dirname(__FILE__)), 'ruby-bigquery-cl', 'import')
require File.join(File.expand_path(File.dirname(__FILE__)), 'ruby-bigquery-cl', 'import_status')
require File.join(File.expand_path(File.dirname(__FILE__)), 'ruby-bigquery-cl', 'table')

$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module RubyBigqueryCl
  VERSION = '0.0.1'
end

require 'test/unit'
require 'dotenv'
Dotenv.load(File.join(File.expand_path(File.dirname(__FILE__)),"..", ".env"))
lib_path =File.join(File.expand_path(File.dirname(__FILE__)),"..", "lib")
$: << lib_path
require 'ucloud/ruby/sdk'
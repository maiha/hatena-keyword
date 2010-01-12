
require "rubygems"
require "xmlrpc/client"
require "nkf"
require "dsl_accessor"

module Hatena
end

__DIR__ = File.dirname(__FILE__)

require __DIR__ + "/hatena/null"
require __DIR__ + "/hatena/keyword"

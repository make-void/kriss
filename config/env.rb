path = File.expand_path "../../", __FILE__
PATH = path

APP_ENV = ENV["RACK_ENV"] || "development"

require 'bundler'
Bundler.require :default, APP_ENV

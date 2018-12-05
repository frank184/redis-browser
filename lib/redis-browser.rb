require 'sinatra/base'
require 'multi_json'
require 'sinatra/json'
require 'slim'
require 'coffee-script'
require 'redis'
require 'redis-browser/version'
require 'redis-browser/browser'
require 'redis-browser/web'

module RedisBrowser
  DEFAULTS = {
    :connections => {
      :default => {
        :url => 'redis://127.0.0.1:6379/0'
      }
    }
  }

  def self.stringify_keys(h)
    h.is_a?(Hash) ? h.collect{|k,v| [k.to_s, stringify_keys(v)]}.to_h : h
  end

  def self.configure(opts)
    Web.configure do |config|
      config.set stringify_keys(opts)
    end
  end
end

RedisBrowser.configure RedisBrowser::DEFAULTS

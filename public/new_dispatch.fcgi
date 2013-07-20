#!/usr/bin/ruby

require 'rubygems'
require 'fcgi'

ENV['RAILS_ENV'] ||= 'development'

# Set GEM_PATH and GEM_HOME
#ENV['GEM_PATH'] ||= '/usr/local/rvm/gems/ruby-1.9.2-p290/gems' #'/usr/local/lib/ruby/gems/1.9.1/gems/'
#ENV['GEM_HOME'] ||= '/usr/local/rvm/gems/ruby-1.9.2-p290/gems' #'/usr/local/lib/ruby/gems/1.9.1/gems/'
# Must not be used, otherwise we get a strange error:
# "Could not find rake-0.8.7 in any of the sources".

#require File.join(File.dirname(__FILE__), '../config/environment')
require File.join('/root/medlink/config/environment.rb')

class Rack::PathInfoRewriter
  def initialize(app)
    @app = app
  end

  def call(env)
    env.delete('SCRIPT_NAME')
    parts = env['REQUEST_URI'].split('?')
    env['PATH_INFO'    ] = parts[0]
    env['QUERY_STRING' ] = parts[1].to_s
    @app.call(env)
  end
end

Rack::Handler::FastCGI.run(
  Rack::PathInfoRewriter.new(
    Medlink::Application
  )
)

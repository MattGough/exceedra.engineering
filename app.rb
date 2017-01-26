require 'sinatra'
require 'dotenv/load'
require 'omniauth'
require 'omniauth-azure-oauth2'

use Rack::Session::Cookie
use OmniAuth::Builder do
  provider :azure_oauth2,
    {
      client_id: ENV['AZURE_CLIENT_ID'],
      client_secret: ENV['AZURE_CLIENT_SECRET'],
      tenant_id: ENV['AZURE_TENANT_ID']
    }
end

get '/blog/?*' do
  jekyll_blog(request.path) {404}
end

get '/' do
  # <<-HTML
  # <a href='/auth/azure_oauth2'>Sign in with Azure Active Directory</a>
  # HTML
  'Hello'
   content_type 'text/plain'
   	request.env['omniauth.auth'].inspect
end

# get '/auth/:name/callback' do
#  	:content_type => 'text/plain'
#  	request.env['omniauth.auth'].inspect
# end

# post '/auth/:name/callback' do
#   auth = request.env['omniauth.auth']
#   # do whatever you want with the information!
# end

def jekyll_blog(path, &missing_file_block)
  @current_menu = "blog"
  @title = "Blog - Exceedra"

  file_path = File.join(File.dirname(__FILE__), 'jekyll_blog/_site',  path.gsub('/blog',''))
  file_path = File.join(file_path, 'index.html') unless file_path =~ /\.[a-z]+$/i

  if File.exist?(file_path)
    file = File.open(file_path, "rb")
    contents = file.read
    file.close

    if (file_path.include?('.xml') || file_path.include?('.css'))
      erb contents, :content_type => 'text/xml'
    else
      erb contents, :layout_engine => :erb
    end
  else
    erb :not_found
  end
end

# begin
#   require 'sinatra'
#   require 'omniauth'
#   require 'omniauth-openid'
#   require 'omniauth-twitter'
#   require 'openid/store/filesystem'
# rescue LoadError
#   require 'rubygems'
#   require 'sinatra'
#   require 'omniauth'
#   require 'openid/store/filesystem'
# end
#
# use Rack::Session::Cookie
# use OmniAuth::Builder do
#   provider :open_id, :store => OpenID::Store::Filesystem.new('/tmp')
#   provider :twitter, 'consumerkey', 'consumersecret'
# end
#
# get '/' do
#   <<-HTML
#   <a href='/auth/twitter'>Sign in with Twitter</a>
#
#   <form action='/auth/open_id' method='post'>
#     <input type='text' name='identifier'/>
#     <input type='submit' value='Sign in with OpenID'/>
#   </form>
#   HTML
# end
#
# post '/auth/:name/callback' do
#   auth = request.env['omniauth.auth']
#   # do whatever you want with the information!
# end
# $:.push File.dirname(__FILE__) + '/../lib'
#
# require 'omniauth-azure-oauth2'
# require 'sinatra'
#
# class MyAzureProvider
#   def self.client_id
#     ENV['AZURE_CLIENT_ID']
#   end
#
#   def self.client_secret
#     ENV['AZURE_CLIENT_SECRET']
#   end
#
#   def self.tenant_id
#     ENV['AZURE_TENANT_ID']
#   end
#
# end
#
# use Rack::Session::Cookie
# use OmniAuth::Strategies::Azure, MyAzureProvider
#
# get '/' do
#   "<a href='/auth/azure_oauth2'>Log in with Azure</a>"
# end
#
# get '/auth/azure_oauth2/callback' do
#   content_type 'text/plain'
#   request.env['omniauth.auth'].inspect
# end

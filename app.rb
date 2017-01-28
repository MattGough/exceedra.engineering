require 'sinatra'
require 'dotenv/load'
require 'omniauth'
require 'omniauth-azure-oauth2'

# use Rack::Session::Cookie
# use OmniAuth::Builder do
#   provider :azure_oauth2,
#     {
#       client_id: ENV['AZURE_CLIENT_ID'],
#       client_secret: ENV['AZURE_CLIENT_SECRET'],
#       tenant_id: ENV['AZURE_TENANT_ID']
#     }
# end

get '/?*' do
  jekyll_blog(request.path) {404}
end

# get '/' do
#   # <<-HTML
#   # <a href='/auth/azure_oauth2'>Sign in with Azure Active Directory</a>
#   # HTML
#   'Hello'
#    content_type 'text/plain'
#    	request.env['omniauth.auth'].inspect
# end

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


    if (file_path.include?('.xml'))
      erb contents, :content_type => 'text/xml'
    elsif (file_path.include?('.css'))
      erb contents, :content_type => 'text/css'
    elsif (file_path.include?('.js'))
      erb contents, :content_type => 'text/javascript'
    elsif (file_path.include?('.png'))
      erb contents, :content_type => 'image/png'
    elsif (file_path.include?('.svg'))
      erb contents, :content_type => 'image/svg+xml'
    elsif (file_path.include?('.jpg'))
      erb contents, :content_type => 'image/pjpeg'
    elsif (file_path.include?('.ico'))
      erb contents, :content_type => 'image/vnd.microsoft.ico'
    elsif (file_path.include?('.woff'))
      erb contents, :content_type => 'application/font-woff'
    else
        erb contents, :layout_engine => :erb
    end
  else
    erb :not_found
  end
end

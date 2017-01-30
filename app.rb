require 'rubygems'
require 'sinatra'
require 'json'
require 'omniauth'
require 'omniauth-azure-oauth2'
require 'dotenv'
Dotenv.load


class SinatraApp < Sinatra::Base
  configure do
    set :sessions, true
    set :inline_templates, true
  end
  use OmniAuth::Builder do
    provider :azure_oauth2,
    {
      client_id: ENV['AZURE_CLIENT_ID'],
      client_secret: ENV['AZURE_CLIENT_SECRET'],
      tenant_id: ENV['AZURE_TENANT_ID']
    }
  end

  get '/' do
    erb "
    <a href='http://localhost:4567/auth/azure_oauth2''><h1>Login with Azure</h1></a><br>"
  end

  get '/blog?*' do
    if session[:authenticated] = true
     jekyll_blog(request.path) {404}
    else
     redirect '/'
    end
  end

  get '/auth/azure_oauth2/callback' do
    puts JSON.pretty_generate(request.env['omniauth.auth'])
    redirect '/blog'
  end

  get '/auth/failure' do
    erb "<h1>Authentication Failed:</h1><h3>message:<h3> <pre>#{params}</pre>"
  end

  get '/auth/:provider/deauthorized' do
    erb "#{params[:provider]} has deauthorized this app."
  end

  get '/protected' do
    throw(:halt, [401, "Not authorized\n"]) unless session[:authenticated]
    erb "<pre>#{request.env['omniauth.auth'].to_json}</pre><hr>
         <a href='/logout'>Logout</a>"
  end

  get '/logout' do
    session[:authenticated] = false
    redirect '/'
  end
  
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
      erb contents, :content_type => 'image/jpeg'
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

end

SinatraApp.run! if __FILE__ == $0

__END__

@@ layout
<html>
  <head>
    <link href='http://twitter.github.com/bootstrap/1.4.0/bootstrap.min.css' rel='stylesheet' />
  </head>
  <body>
    <div class='container'>
      <div class='content'>
        <%= yield %>
      </div>
    </div>
  </body>
</html>

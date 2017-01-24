require 'sinatra'

get '/blog/?*' do
  jekyll_blog(request.path) {404}
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

    if (file_path.include?('.xml') || file_path.include?('.css'))
      erb contents, :content_type => 'text/xml'
    else
      erb contents, :layout_engine => :erb
    end
  else
    erb :not_found
  end
end

require "sinatra"
# reloader aids in rapid development so that you don't have to restart the
# sinatra server so much. Apparently works on Windows too!
require "sinatra/reloader" if development?

# This renders the Home page from the HTML
get "/" do
  txt = File.read(File.join('public', 'index.html'))
  txt
end

# add HAML pages here
get "/example" do
  haml :example
end

get "/help" do
  haml :help
end


get "/scripts/*.js" do
  page = "js/#{params[:splat][0]}".to_sym
  coffee page
end

get "/styles/*.css" do
  page = "css/#{params[:splat][0]}".to_sym
  sass page, :style => :expanded
end

not_found do
  redirect "/404.html"
end
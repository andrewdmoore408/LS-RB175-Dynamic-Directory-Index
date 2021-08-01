require 'tilt/erubis'
require 'sinatra'
require 'sinatra/reloader'

get "/" do
  @title = "Dynamic Directory"

  @dir_list = Dir.children("public")
  erb :index
end
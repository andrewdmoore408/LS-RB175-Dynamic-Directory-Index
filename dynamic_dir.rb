require 'tilt/erubis'
require 'sinatra'
require 'sinatra/reloader'

get "/" do
  @title = "Dynamic Directory"
  @wd = "public"

  @files_only = Dir.children(@wd).reject { |item| File.directory?("#{@wd}/#{item}") }

  erb :index
end
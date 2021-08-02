require 'tilt/erubis'
require 'sinatra'
require 'sinatra/reloader'

get "/:sort_order" do
  @title = "Dynamic Directory"
  @wd = "public"

  sort_ascending = (params['sort_order'] == 'reverse' ? false : true)

  @files_only = Dir.children(@wd).reject { |item| File.directory?("#{@wd}/#{item}") }

  @files_sorted = if sort_ascending
                    @files_only.sort
                  else
                    @files_only.sort.reverse
                  end

  erb :index
end
require "sinatra/base"
require "haml"
require "sass"
require "sinatra/assetpack"

class App < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "app", "views") }
  register Sinatra::AssetPack

  assets {
    serve "/js",     from: "app/js"        # Default
    serve "/css",    from: "app/css"       # Default
    serve "/assets", from: "app/images"    # Default
  }

  get "/" do
    erb :dashboard
  end

  get "/playground" do
    erb :playground
  end
end

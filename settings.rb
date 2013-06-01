class Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "app", "views") }
end

require 'models/robot_manager'

class RobotManagerApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')

  get "/" do
    erb :index
  end


  get '/robots' do
    @tasks = ["task1", "task2", "task3"]
    erb :dashboard
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    RobotManager.create(params[:robot])
    redirect '/robots'
  end

  get "/upload" do
    erb :upload
  end
# # Handle POST-request (Receive and save the uploaded file)
# post "/upload" do
#   File.open('uploads/' + params['myfile'][:filename], "w") do |f|
#     f.write(params['myfile'][:tempfile].read)
#   end
#   return "The file was successfully uploaded!"
# end
#



  get "/new_robot" do
    erb :form
  end

  post '/save_image' do

  @filename = params[:file][:filename]
  file = params[:file][:tempfile]

  File.open("app/public/images/#{@filename}", 'wb') do |f|
    f.write(file.read)
  end

  erb :show_image
  end

end

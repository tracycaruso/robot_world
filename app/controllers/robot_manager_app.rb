class RobotManagerApp < Sinatra::Base
  get "/" do
    @title = "Robot World"
    erb :index
  end

  # See all Robots
  get "/robots" do
    @title = "Robot Directory"
    @robots = RobotManager.all
    erb :directory
  end

  # Create new Robot / Show Form
  get '/robots/new' do
    @title = "Create New Robot"
    erb :new
  end

  # View Dashboard
  get '/dashboard' do
    @title = "Dashboard"
    erb :dashboard
  end

  # Add Robot to Database
  post '/robots' do
    RobotManager.create(params[:robot])
    parameters = params[:robot]
    if parameters.has_key?("file")
      @filename = params[:robot][:file][:filename] ||= "no file"
      file = params[:robot][:file][:tempfile]
      File.open("app/public/images/#{@filename}", 'wb') do |f|
        f.write(file.read)
      end
    end
    # puts request.inspect
    # puts request.inspect
    redirect '/robots'
  end

  get '/robots/:id' do |id|
    @robot = RobotManager.find(id.to_i)
    @title = @robot.name
    erb :single
  end

  # # # edit robot
  get "/robots/:id/edit" do |id|
    @robot = RobotManager.find(id.to_i)
    @title = "Edit #{@robot.name}"
    erb :edit
  end

  put '/robots/:id' do |id|
    RobotManager.update(id.to_i, params[:robot])
    redirect "/robots/#{id}"
  end

  delete '/robots/:id' do |id|
    RobotManager.destroy(id.to_i)
    redirect "/robots"
  end

  not_found do
    @title = "An Error Occured"
    erb :error
  end


end

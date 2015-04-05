class Robot
  attr_reader :id,
              :name,
              :city,
              :state,
              :birthdate,
              :datehired,
              :department,
              :file

  def initialize(robot)
    @id = robot["id"]
    @name = robot["name"]
    @city = robot["city"]
    @state = robot["state"]
    @birthdate = robot["birthdate"]
    @datehired = robot["datehired"]
    @department = robot["department"]
    @file = robot["file"]
  end

end

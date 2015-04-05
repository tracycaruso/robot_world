require 'yaml/store'

class RobotManager
  def self.create(robot)
    database.transaction do
      if robot.has_key?("file")
        image = "/images/#{robot[:file][:filename]}"
      else
        image = "no image given"
      end
      database['robots'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['robots'] << {
        "id" => database['total'],
        "name" => robot[:name],
        "city" => robot[:city],
        "state" => robot[:state],
        "birthdate" => robot[:birthdate],
        "datehired" => robot[:datehired],
        "department" => robot[:department],
        "file" => image
        }
    end
  end

  def self.database
    if ENV["ROBOT_MANAGER_ENV"] == 'test'
      @database ||= YAML::Store.new("../../db/robot_manager_test")
    else
      @database ||= YAML::Store.new("db/robot_manager")
    end
  end

  def self.raw_robots
    database.transaction do
      database['robots'] || []
    end
  end

  def self.all
    raw_robots.map{|robot| Robot.new(robot)}
  end

  def self.raw_robot(id)
    raw_robots.find{|robot| robot["id"] == id}
  end

  def self.find(id)
    Robot.new(raw_robot(id))
  end

  def self.update(id, robot)
    database.transaction do
      target = database['robots'].find { |robot| robot["id"]  == id}
      target["name"] = robot[:name]
      target["city"] = robot[:city]
      target["state"] = robot[:state]
      target["birthdate"] = robot[:birthdate]
      target["datehired"] = robot[:datehired]
      target["department"] = robot[:department]
     end
  end

  def self.destroy(id)
    database.transaction do
      database['robots'].delete_if{ |robot| robot["id"] == id }
    end
  end

  def self.delete_all
    #database.from(:tasks).delete
    database.transaction do
      database['robots'] = []
      database['total'] = 0
    end
  end



end

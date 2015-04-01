require 'yaml/store'

class RobotManager
  def self.database
    @database ||= YAML::Store.new("db/robot_manager")
  end

  def self.create(robot)
    database.transaction do
      database['robots'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['robots'] << {
        "id" => database['total'],
        "name" => task[:name],
        "city" => task[:city],
        "state" => task[:state],
        "birthdate" => task[:birthdate],
        "datehired" => task[:datehired],
        "department" => task[:department]
        }
    end
  end
end

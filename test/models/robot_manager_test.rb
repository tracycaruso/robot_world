# @params={"robot"=>{"name"=>"Tracy", "city"=>"Denver", "state"=>"CO", "birthdate"=>"April", "datehired"=>"May", "department"=>"Tech", "file"=>{:filename=>"2.jpg", :type=>"image/jpeg", :name=>"robot[file]", :tempfile=>#<Tempfile:/var/folders/gx/xymb2hr16hsc31m1p3qjmy600000gn/T/RackMultipart20150403-51144-soaovk.jpg>, :head=>"Content-Disposition: form-data; name=\"robot[file]\"; filename=\"2.jpg\"\r\nContent-Type: image/jpeg\r\n"}}}>
require 'byebug'
require_relative '../test_helper'

class RobotManagerTest < Minitest::Test

  # def teardown
  #   RobotManager.delete_all
  # end

  def create_robots(num)
    temp = #<Tempfile:/var/folders/gx/xymb2hr16hsc31m1p3qjmy600000gn/T/RackMultipart20150403-51144-soaovk.jpg>

    num.times do |x|
      RobotManager.create({
        name:"robot#{x}",
        city: "city#{x}",
        state: "state#{x}",
        birthdate: "birthdate#{x}",
        datehired: "datehired#{x}",
        department: "department#{x}",
        file: {:filename=>"2.jpg", :type=>"image/jpeg", :name=>"robot[file]", :tempfile=> temp, :head=>"Content-Disposition: form-data; name=\"robot[file]\"; filename=\"2.jpg\"\r\nContent-Type: image/jpeg\r\n"}
      })
    end
  end

  def test_can_create_a_robot_with_a_name
    create_robots(2)
    robot1 = RobotManager.find(1)
    assert_equal "robot0", robot1.name

    robot2 = RobotManager.find(2)
    assert_equal "robot1", robot2.name
  end

  def test_can_create_a_robot_with_a_city
    create_robots(2)
    robot1 = RobotManager.find(1)
    assert_equal "city0", robot1.city

    robot2 = RobotManager.find(2)
    assert_equal "city1", robot2.city
  end

  def test_can_create_a_robot_with_a_state
    create_robots(2)
    robot1 = RobotManager.find(1)
    assert_equal "state0", robot1.state

    robot2 = RobotManager.find(2)
    assert_equal "state1", robot2.state
  end

  def test_can_create_a_robot_with_a_birthdate
    create_robots(2)
    robot1 = RobotManager.find(1)
    assert_equal "birthdate0", robot1.birthdate

    robot2 = RobotManager.find(2)
    assert_equal "birthdate1", robot2.birthdate
  end

  def test_can_create_a_robot_with_a_datehired
    create_robots(2)
    robot1 = RobotManager.find(1)
    assert_equal "datehired0", robot1.datehired

    robot2 = RobotManager.find(2)
    assert_equal "datehired1", robot2.datehired
  end

  def test_can_create_a_robot_with_a_department
    create_robots(2)
    robot1 = RobotManager.find(1)
    assert_equal "department0", robot1.department

    robot2 = RobotManager.find(2)
    assert_equal "department1", robot2.department
  end

  def test_it_can_return_all_robots
    create_robots(5)
    robots = RobotManager.all
    assert_equal 5, robots.length
  end

  def test_it_can_update_a_robot
    create_robots(1)
    assert_equal "robot0", RobotManager.find(1).name
    assert_equal "city0", RobotManager.find(1).city
    RobotManager.update(1, {name: "new robot", city: "new city"})
    assert_equal "new robot", RobotManager.find(1).name
    assert_equal "new city", RobotManager.find(1).city
  end

  def test_it_can_return_delete_a_robot
    create_robots(5)
    robots = RobotManager.all
    assert_equal 5, robots.length
    RobotManager.destroy(1)
    robots = RobotManager.all
    assert_equal 4, robots.length
  end

end

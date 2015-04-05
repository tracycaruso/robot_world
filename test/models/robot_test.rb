require_relative '../test_helper'

class RobotTest < Minitest::Test
  def test_robot_is_assigned_correct_attributes
    robo = Robot.new({
      "name" => "robot",
      "city" => "denver",
      "state" => "CO",
      "birthdate" => "04/22/1985",
      "datehired" => "02/03/2015",
      "department" => "tech",
      "id" => 1})

    robo2 = Robot.new({
      "name" => "robot2",
      "city" => "harrisburg",
      "state" => "PA",
      "birthdate" => "05/22/1985",
      "datehired" => "03/03/2015",
      "department" => "web",
      "id" => 2})
      
    assert_equal "robot", robo.name
    assert_equal "denver", robo.city
    assert_equal "CO", robo.state
    assert_equal "04/22/1985", robo.birthdate
    assert_equal "02/03/2015", robo.datehired
    assert_equal "tech", robo.department
    assert_equal 1, robo.id

    assert_equal "robot2", robo2.name
    assert_equal "harrisburg", robo2.city
    assert_equal "PA", robo2.state
    assert_equal "05/22/1985", robo2.birthdate
    assert_equal "03/03/2015", robo2.datehired
    assert_equal "web", robo2.department
    assert_equal 2, robo2.id
  end
end

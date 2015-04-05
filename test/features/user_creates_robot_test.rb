require_relative '../test_helper'
class UserCreatesRobotTest < FeatureTest

  def test_user_can_create_a_robot
    visit '/robots/new'
    fill_in "robot[name]", with: "Robot Man"
    fill_in "robot[city]", with: "Robot City"
    fill_in "robot[state]", with: "Robot State"
    fill_in "robot[birthdate]", with: "Robot Bday"
    fill_in "robot[datehired]", with: "Robot Dhired"
    fill_in "robot[department]", with: "Robot Department"
    click_link_or_button("submit")

    assert_equal '/robots', current_path
    assert page.has_content?("Robot Man")
  end

end

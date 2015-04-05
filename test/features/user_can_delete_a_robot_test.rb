require_relative '../test_helper'
class UserDeleteRobotTest < FeatureTest

  def test_user_can_delete_a_robot
    create_robots(1)
    visit '/robots'
    assert page.has_content?("Robot0")
    within(".robot_1") do
      click_link_or_button("delete")
    end
    refute page.has_content?("Robot0")
  end

  def test_user_can_delete_a_different_robot
    create_robots(3)
    visit '/robots'
    assert page.has_content?("Robot1")
    within(".robot_2") do
      click_link_or_button("delete")
    end
    refute page.has_content?("Robot1")
  end
end

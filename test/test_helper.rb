ENV['ROBOT_MANAGER_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'

class Minitest::Test
  def teardown
    RobotManager.delete_all
  end
end

Capybara.app = RobotManagerApp


class FeatureTest < Minitest::Test
  include Capybara::DSL

end

# As a user
# When I click new task
# And I fill out the two forms
# And I press the submit button
# Then a task will be added to the list
#
# within('#welcome') do
#   assert page.has_contect?('kenny')
# end

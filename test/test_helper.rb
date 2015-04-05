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

  def create_robots(num)
    temp = #<Tempfile:/var/folders/gx/xymb2hr16hsc31m1p3qjmy600000gn/T/RackMultipart20150403-51144-soaovk.jpg>

    num.times do |x|
      RobotManager.create({
        name:"Robot#{x}",
        city: "city#{x}",
        state: "state#{x}",
        birthdate: "birthdate#{x}",
        datehired: "datehired#{x}",
        department: "department#{x}",
        file: {:filename=>"2.jpg", :type=>"image/jpeg", :name=>"robot[file]", :tempfile=> temp, :head=>"Content-Disposition: form-data; name=\"robot[file]\"; filename=\"2.jpg\"\r\nContent-Type: image/jpeg\r\n"}
      })
    end
  end


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

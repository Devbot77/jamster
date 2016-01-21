require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  test "course show" do 
  	course = FactoryGirl.create(:course)
  	get :show, :id => course.id
  	assert_response :success
  end
end

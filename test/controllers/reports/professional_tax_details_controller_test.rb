require 'test_helper'

class Reports::ProfessionalTaxDetailsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end

require 'test_helper'

class SubscriptionSettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get subscribe" do
    get subscription_settings_subscribe_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get subscription_settings_unsubscribe_url
    assert_response :success
  end

end

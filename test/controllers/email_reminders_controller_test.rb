require 'test_helper'

class EmailRemindersControllerTest < ActionController::TestCase
  setup do
    @email_reminder = email_reminders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:email_reminders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create email_reminder" do
    assert_difference('EmailReminder.count') do
      post :create, email_reminder: { email_bcc: @email_reminder.email_bcc, email_cc: @email_reminder.email_cc, email_text: @email_reminder.email_text, email_to: @email_reminder.email_to, frequency: @email_reminder.frequency, reminder_from: @email_reminder.reminder_from, reminder_to: @email_reminder.reminder_to, status: @email_reminder.status, task_date: @email_reminder.task_date, task_id: @email_reminder.task_id }
    end

    assert_redirected_to email_reminder_path(assigns(:email_reminder))
  end

  test "should show email_reminder" do
    get :show, id: @email_reminder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @email_reminder
    assert_response :success
  end

  test "should update email_reminder" do
    patch :update, id: @email_reminder, email_reminder: { email_bcc: @email_reminder.email_bcc, email_cc: @email_reminder.email_cc, email_text: @email_reminder.email_text, email_to: @email_reminder.email_to, frequency: @email_reminder.frequency, reminder_from: @email_reminder.reminder_from, reminder_to: @email_reminder.reminder_to, status: @email_reminder.status, task_date: @email_reminder.task_date, task_id: @email_reminder.task_id }
    assert_redirected_to email_reminder_path(assigns(:email_reminder))
  end

  test "should destroy email_reminder" do
    assert_difference('EmailReminder.count', -1) do
      delete :destroy, id: @email_reminder
    end

    assert_redirected_to email_reminders_path
  end
end

class EmailRemindersController < ApplicationController
  before_action :set_email_reminder, only: [:show, :edit, :update, :destroy]

  # GET /email_reminders
  # GET /email_reminders.json
  def index
    @email_reminders = EmailReminder.all
    @email_reminder = EmailReminder.new
    session[:active_tab] = "InformationManagement"
    session[:active_tab1] = "Events"
  end

  # GET /email_reminders/1
  # GET /email_reminders/1.json
  def show
  end

  # GET /email_reminders/new
  def new
    @email_reminder = EmailReminder.new
  end

  # GET /email_reminders/1/edit
  def edit
  end

  # POST /email_reminders
  # POST /email_reminders.json
  def create
    @email_reminder = EmailReminder.new(email_reminder_params)

    if @email_reminder.save
      @email_reminders = EmailReminder.all
      @email_reminder = EmailReminder.new
      @flag = true
    else
      @flag = false
    end
  end

  # PATCH/PUT /email_reminders/1
  # PATCH/PUT /email_reminders/1.json
  def update
    if @email_reminder.update(email_reminder_params)
      @email_reminders = EmailReminder.all
      @email_reminder = EmailReminder.new
      @flag = true
    else
      @flag = false
    end
  end

  # DELETE /email_reminders/1
  # DELETE /email_reminders/1.json
  def destroy
    @email_reminder.destroy
    @email_reminders = EmailReminder.all
    redirect_to email_reminders_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_reminder
      @email_reminder = EmailReminder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_reminder_params
      params.require(:email_reminder).permit(:task_id, :frequency, :task_date, :reminder_from, :reminder_to, :email_to, :email_cc, :email_bcc, :email_text, :status)
    end
end

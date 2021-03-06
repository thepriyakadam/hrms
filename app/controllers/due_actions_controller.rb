class DueActionsController < ApplicationController
  before_action :set_due_action, only: [:show, :edit, :update, :destroy]

  # GET /due_actions
  # GET /due_actions.json
  def index
    @due_actions = DueAction.all
  end

  # GET /due_actions/1
  # GET /due_actions/1.json
  def show
  end

  # GET /due_actions/new
  def new
    # byebug
    @due_action = DueAction.new
    # @due_detail = DueDetail.find(params[:due_detail_id])
    @due_employee_detail = DueEmployeeDetail.find(params[:due_employee_detail_id])
    # @due_actions = DueAction.where(due_detail_id: @due_detail.id)
    @due_actions = DueAction.where(due_employee_detail_id: @due_employee_detail.id)
  end

  # GET /due_actions/1/edit
  def edit
  end

  # POST /due_actions
  # POST /due_actions.json

  def create
     @due_action = DueAction.new(due_action_params)
     @due_actions = DueAction.all
      if @due_action.save
        # byebug
        @due_action = DueAction.new
        flash[:notice] = 'Due Action created Successfully.'   
      end
      @due_employee_detail_id = DueEmployeeDetail.find(params[:due_action][:due_employee_detail_id])
      redirect_to new_due_action_path(due_employee_detail_id: @due_employee_detail_id.id)
  end

  # PATCH/PUT /due_actions/1
  # PATCH/PUT /due_actions/1.json


  def update
    @due_action.update(due_action_params)
    @due_action = DueAction.new
    @due_employee_detail = DueEmployeeDetail.find(params[:due_employee_detail_id])
    @due_actions = DueAction.where(due_employee_detail_id: @due_employee_detail.id)
    flash[:notice] = 'Due Action updated Successfully.'   
  end

  # DELETE /due_actions/1
  # DELETE /due_actions/1.json

  def destroy
    @due_action.destroy
    @due_actions = DueAction.all
  end

  def confirm_employee_due_action
    # byebug
    # @due_employee_detail = DueEmployeeDetail.find(params[:due_employee_detail_id])
    @due_action_ids = params[:due_action_ids]
    if @due_action_ids.nil?
      flash[:alert] = "Please Select the Checkbox"
      redirect_to employee_due_detail_history_due_details_path
    else
      @due_action_ids.each do |did|
        @due_action = DueAction.find(did)
        @due_action.update(is_confirm: true)
        # byebug
        # if @due_action.is_exist(@due_action.due_employee_detail_id)
        #  DueEmployeeDetail.where(id: @due_action.due_employee_detail_id).update_all(is_confirmed: true)
        # else
        # end
        a=DueAction.where(due_employee_detail_id: @due_action.due_employee_detail_id,is_confirm: false)
        if a.present?
        else
          DueEmployeeDetail.where(id: @due_action.due_employee_detail_id).update_all(is_confirmed: true)
        end
        flash[:notice] = "Confirmed Successfully"
      end
      redirect_to employee_due_detail_history_due_details_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_due_action
      @due_action = DueAction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def due_action_params
      params.require(:due_action).permit(:due_detail_id, :name, :remark, :status,:is_confirm,:amount, :due_detail_id, :due_employee_detail_id)
    end
end
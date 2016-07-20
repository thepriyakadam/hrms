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
    @due_action = DueAction.new
    @due_detail = DueDetail.find(params[:due_detail_id])
    @due_actions = DueAction.where(due_detail_id: @due_detail.id)
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
        @due_action = DueAction.new
      end
      @due_detail_id = DueDetail.find(params[:due_action][:due_detail_id])
      redirect_to new_due_action_path(due_detail_id: @due_detail_id.id)
      flash[:notice] = 'Due Action created Successfully.'   
  end

  # PATCH/PUT /due_actions/1
  # PATCH/PUT /due_actions/1.json


  def update
    @due_action.update(due_action_params)
    @due_action = DueAction.new
    @due_detail = DueDetail.find(params[:due_detail_id])
    @due_actions = DueAction.where(due_detail_id: @due_detail.id)
    @due_detail_id = DueDetail.find(params[:due_action][:due_detail_id])
    redirect_to new_due_action_path(due_detail_id: @due_detail_id.id)
    flash[:notice] = 'Due Detail updated Successfully.'   
  end

  # DELETE /due_actions/1
  # DELETE /due_actions/1.json

  def destroy
    @due_action.destroy
    @due_actions = DueAction.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_due_action
      @due_action = DueAction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def due_action_params
      params.require(:due_action).permit(:due_detail_id, :name, :remark, :amount, :due_detail_id)
    end
end

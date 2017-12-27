# require 'query_report/helper'  # need to require the helper
class StatesController < ApplicationController
  before_action :set_state, only: [:show, :edit, :update, :destroy]
  # include QueryReport::Helper  # need to include it

  # GET /states
  # GET /states.json
  def index
    @states = State.all
  end

  # GET /states/1
  # GET /states/1.json
  def show
  end

  # GET /states/new
  def new
    @state = State.new
    @states = State.all
  end

  # GET /states/1/edit
  def edit
  end


  # POST /states
  # POST /states.json
  def create
    @state = State.new(state_params)
    @states = State.all
    respond_to do |format|
      if @state.save
        @state = State.new
       format.js { @flag = true }
      else
        flash.now[:alert] = 'state Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /states/1
  # PATCH/PUT /states/1.json
  def update
     @state.update(state_params)
     @states = State.all
     @state = State.new

  end

  # DELETE /states/1
  # DELETE /states/1.json
  def destroy
    @state.destroy
    @states = State.all
  end

  def list_state
    reporter(State.filter_records(current_user), template_class: PdfReportTemplate) do
      column(:ID, sortable: true) { |state| state.id }
      column(:Code, sortable: true) { |state| state.code }
      column(:Name, sortable: true) { |state| state.name }
      column(:ci, sortable: true) { |state| state.try(:country_id) }
    end
  end


  def state_master
    @states = State.all
     respond_to do |f|
      f.js
      f.xls {render template: 'states/state_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' state_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'states/state_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_state
    @state = State.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def state_params
    params.require(:state).permit(:country_id, :code, :name)
  end
end

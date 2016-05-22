class StatesController < ApplicationController
  before_action :set_state, only: [:show, :edit, :update, :destroy]

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

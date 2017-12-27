class ThoughtsController < ApplicationController
  before_action :set_thought, only: [:show, :edit, :update, :destroy]

  # GET /thoughts
  # GET /thoughts.json
  def index
    @thought = Thought.new
    @thoughts = Thought.all
  end

  # GET /thoughts/1
  # GET /thoughts/1.json
  def show
  end

  # GET /thoughts/new
  def new
    @thought = Thought.new
    @thoughts = Thought.all
    session[:active_tab] = "InformationManagement"
    session[:active_tab1] = "Events"
  end

  # GET /thoughts/1/edit
  def edit
  end

  # POST /thoughts
  # POST /thoughts.json
  def create
    @thought = Thought.new(thought_params)
    @thoughts = Thought.all
    respond_to do |format|
      if @thought.save
         @thought = Thought.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Thought Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /thoughts/1
  # PATCH/PUT /thoughts/1.json
  def update
    @thought.update(thought_params)
    @thoughts = Thought.all
    @thought = Thought.new
  end

  # DELETE /thoughts/1
  # DELETE /thoughts/1.json
  def destroy
    @thought.destroy
    @thoughts = Thought.all
  end

  def import
    # byebug
    file = params[:file]
    if file.nil?
      flash[:alert] = "Please Select File!"
    redirect_to import_xl_thoughts_path
    else
    Thought.import(params[:file])
    redirect_to import_xl_thoughts_path, notice: "File imported."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thought
      @thought = Thought.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thought_params
      params.require(:thought).permit(:date, :thought, :thought_of)
    end
end

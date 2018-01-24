class AnswerMastersController < ApplicationController
  before_action :set_answer_master, only: [:show, :edit, :update, :destroy]

  # GET /answer_masters
  # GET /answer_masters.json
  def index
    @answer_masters = AnswerMaster.all
  end

  # GET /answer_masters/1
  # GET /answer_masters/1.json
  def show
  end

  # GET /answer_masters/new
  def new
    @answer_master = AnswerMaster.new
    @answer_masters = AnswerMaster.all
    session[:active_tab] ="Survey"
    session[:active_tab1] ="Setup"
  end

  # GET /answer_masters/1/edit
  def edit
  end

  # POST /answer_masters
  # POST /answer_masters.json
  def create
    @answer_master = AnswerMaster.new(answer_master_params)
    @answer_masters = AnswerMaster.all
    respond_to do |format|
      if @answer_master.save
         @answer_master = AnswerMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Answer Already Exist.'
        format.js { @flag = false }
      end
    end

    # @answer_master = AnswerMaster.new(answer_master_params)

    # respond_to do |format|
    #   if @answer_master.save
    #     format.html { redirect_to @answer_master, notice: 'Answer master was successfully created.' }
    #     format.json { render :show, status: :created, location: @answer_master }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @answer_master.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /answer_masters/1
  # PATCH/PUT /answer_masters/1.json
  def update
    @answer_master.update(answer_master_params)
    @answer_master = AnswerMaster.new
    @answer_masters = AnswerMaster.all
    # respond_to do |format|
    #   if @answer_master.update(answer_master_params)
    #     format.html { redirect_to @answer_master, notice: 'Answer master was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @answer_master }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @answer_master.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /answer_masters/1
  # DELETE /answer_masters/1.json
  def destroy
    @answer_master.destroy
    @answer_masters = AnswerMaster.all
    # @answer_master.destroy
    # respond_to do |format|
    #   format.html { redirect_to answer_masters_url, notice: 'Answer master was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer_master
      @answer_master = AnswerMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_master_params
      params.require(:answer_master).permit(:code, :name, :status)
    end
end

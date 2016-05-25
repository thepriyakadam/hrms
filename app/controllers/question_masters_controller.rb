class QuestionMastersController < ApplicationController
  before_action :set_question_master, only: [:show, :edit, :update, :destroy]

  # GET /question_masters
  # GET /question_masters.json
  def index
    @question_masters = QuestionMaster.all
  end

  # GET /question_masters/1
  # GET /question_masters/1.json
  def show
  end

  # GET /question_masters/new
  def new
    @question_master = QuestionMaster.new
  end

  # GET /question_masters/1/edit
  def edit
  end

  # POST /question_masters
  # POST /question_masters.json
  def create
    @question_master = QuestionMaster.new(question_master_params)

    respond_to do |format|
      if @question_master.save
        format.html { redirect_to @question_master, notice: 'Question master was successfully created.' }
        format.json { render :show, status: :created, location: @question_master }
      else
        format.html { render :new }
        format.json { render json: @question_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_masters/1
  # PATCH/PUT /question_masters/1.json
  def update
    respond_to do |format|
      if @question_master.update(question_master_params)
        format.html { redirect_to @question_master, notice: 'Question master was successfully updated.' }
        format.json { render :show, status: :ok, location: @question_master }
      else
        format.html { render :edit }
        format.json { render json: @question_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_masters/1
  # DELETE /question_masters/1.json
  def destroy
    @question_master.destroy
    respond_to do |format|
      format.html { redirect_to question_masters_url, notice: 'Question master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_master
      @question_master = QuestionMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_master_params
      params.require(:question_master).permit(:code, :name, :description)
    end
end

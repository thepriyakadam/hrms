class VacancyMastersController < ApplicationController
  before_action :set_vacancy_master, only: [:show, :edit, :update, :destroy]

  # GET /vacancy_masters
  # GET /vacancy_masters.json


  def index
    @vacancy_masters = VacancyMaster.all
    @vacancy_masters = VacancyMaster.order(:vacancy_name)
    respond_to do |format|
    format.html
    format.csv { send_data @vacancy_masters.to_csv }
    format.xls 
  end
  end

  # GET /vacancy_masters/1
  # GET /vacancy_masters/1.json
  def show
  end

  # GET /vacancy_masters/new
  def new
    @vacancy_master = VacancyMaster.new
  end

  def import
  VacancyMaster.import(params[:file])
  redirect_to root_url, notice: "Vacancy Master imported successfully........!"
end

  # GET /vacancy_masters/1/edit
  def edit
  end

  # POST /vacancy_masters
  # POST /vacancy_masters.json
  def create
    @vacancy_master = VacancyMaster.new(vacancy_master_params)

    respond_to do |format|
      if @vacancy_master.save
        format.html { redirect_to @vacancy_master, notice: 'Vacancy master was successfully created.' }
        format.json { render :show, status: :created, location: @vacancy_master }
      else
        format.html { render :new }
        format.json { render json: @vacancy_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacancy_masters/1
  # PATCH/PUT /vacancy_masters/1.json
  def update
    respond_to do |format|
      if @vacancy_master.update(vacancy_master_params)
        format.html { redirect_to @vacancy_master, notice: 'Vacancy master was successfully updated.' }
        format.json { render :show, status: :ok, location: @vacancy_master }
      else
        format.html { render :edit }
        format.json { render json: @vacancy_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacancy_masters/1
  # DELETE /vacancy_masters/1.json
  def destroy
    @vacancy_master.destroy
    respond_to do |format|
      format.html { redirect_to vacancy_masters_url, notice: 'Vacancy master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacancy_master
      @vacancy_master = VacancyMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vacancy_master_params
      params.require(:vacancy_master).permit(:job_title, :vacancy_name, :educational_qualification, :no_of_position, :description, :vacancy_post_date, :department_name, :budget)
    end
end

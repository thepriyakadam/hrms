class EsicEmployersController < ApplicationController
  before_action :set_esic_employer, only: [:show, :edit, :update, :destroy]

  # GET /esic_employers
  # GET /esic_employers.json
  def index
    @esic_employers = EsicEmployer.all
  end

  # GET /esic_employers/1
  # GET /esic_employers/1.json
  def show
  end

  # GET /esic_employers/new
  def new
    @esic_employer = EsicEmployer.new
  end

  # GET /esic_employers/1/edit
  def edit
  end

  # POST /esic_employers
  # POST /esic_employers.json
  def create
    @esic_employer = EsicEmployer.new(esic_employer_params)

    respond_to do |format|
      if @esic_employer.save
        format.html { redirect_to @esic_employer, notice: 'Esic employer was successfully created.' }
        format.json { render :show, status: :created, location: @esic_employer }
      else
        format.html { render :new }
        format.json { render json: @esic_employer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /esic_employers/1
  # PATCH/PUT /esic_employers/1.json
  def update
    respond_to do |format|
      if @esic_employer.update(esic_employer_params)
        format.html { redirect_to @esic_employer, notice: 'Esic employer was successfully updated.' }
        format.json { render :show, status: :ok, location: @esic_employer }
      else
        format.html { render :edit }
        format.json { render json: @esic_employer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /esic_employers/1
  # DELETE /esic_employers/1.json
  def destroy
    @esic_employer.destroy
    respond_to do |format|
      format.html { redirect_to esic_employers_url, notice: 'Esic employer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_esic_employer
      @esic_employer = EsicEmployer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def esic_employer_params
      params.require(:esic_employer).permit(:base_component, :percentage, :effective_from, :effective_to, :is_active, :is_confirm)
    end
end

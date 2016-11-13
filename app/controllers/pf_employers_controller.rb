class PfEmployersController < ApplicationController
  before_action :set_pf_employer, only: [:show, :edit, :update, :destroy]

  # GET /pf_employers
  # GET /pf_employers.json
  def index
    @pf_employers = PfEmployer.all
  end

  # GET /pf_employers/1
  # GET /pf_employers/1.json
  def show
  end

  # GET /pf_employers/new
  def new
    @pf_employer = PfEmployer.new
  end

  # GET /pf_employers/1/edit
  def edit
  end

  # POST /pf_employers
  # POST /pf_employers.json
  def create
    @pf_employer = PfEmployer.new(pf_employer_params)

    respond_to do |format|
      if @pf_employer.save
        format.html { redirect_to @pf_employer, notice: 'Pf employer was successfully created.' }
        format.json { render :show, status: :created, location: @pf_employer }
      else
        format.html { render :new }
        format.json { render json: @pf_employer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pf_employers/1
  # PATCH/PUT /pf_employers/1.json
  def update
    respond_to do |format|
      if @pf_employer.update(pf_employer_params)
        format.html { redirect_to @pf_employer, notice: 'Pf employer was successfully updated.' }
        format.json { render :show, status: :ok, location: @pf_employer }
      else
        format.html { render :edit }
        format.json { render json: @pf_employer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pf_employers/1
  # DELETE /pf_employers/1.json
  def destroy
    @pf_employer.destroy
    respond_to do |format|
      format.html { redirect_to pf_employers_url, notice: 'Pf employer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pf_employer
      @pf_employer = PfEmployer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pf_employer_params
      params.require(:pf_employer).permit(:base_component, :percentage, :effective_from, :effective_to, :is_active, :is_confirm)
    end
end

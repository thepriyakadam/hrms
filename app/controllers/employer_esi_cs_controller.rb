class EmployerEsiCsController < ApplicationController
  before_action :set_employer_esic, only: [:show, :edit, :update, :destroy]

  # GET /employer_esics
  # GET /employer_esics.json
  def index
    @employer_esics = EmployerEsic.all
  end

  # GET /employer_esics/1
  # GET /employer_esics/1.json
  def show
  end

  # GET /employer_esics/new
  def new
    @employer_esic = EmployerEsic.new
  end

  # GET /employer_esics/1/edit
  def edit
  end

  # POST /employer_esics
  # POST /employer_esics.json
  def create
    @employer_esic = EmployerEsic.new(employer_esic_params)

    respond_to do |format|
      if @employer_esic.save
        format.html { redirect_to @employer_esic, notice: 'Employer esic was successfully created.' }
        format.json { render :show, status: :created, location: @employer_esic }
      else
        format.html { render :new }
        format.json { render json: @employer_esic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employer_esics/1
  # PATCH/PUT /employer_esics/1.json
  def update
    respond_to do |format|
      if @employer_esic.update(employer_esic_params)
        format.html { redirect_to @employer_esic, notice: 'Employer esic was successfully updated.' }
        format.json { render :show, status: :ok, location: @employer_esic }
      else
        format.html { render :edit }
        format.json { render json: @employer_esic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employer_esics/1
  # DELETE /employer_esics/1.json
  def destroy
    @employer_esic.destroy
    respond_to do |format|
      format.html { redirect_to employer_esics_url, notice: 'Employer esic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employer_esic
      @employer_esic = EmployerEsic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employer_esic_params
      params.require(:employer_esic).permit(:base_component, :percentage, :effective_from, :effective_to, :is_active, :is_confirm)
    end
end

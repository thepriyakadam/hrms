class EmployerPFsController < ApplicationController
  before_action :set_employer_pf, only: [:show, :edit, :update, :destroy]

  # GET /employer_pfs
  # GET /employer_pfs.json
  def index
    @employer_pfs = EmployerPf.all
  end

  # GET /employer_pfs/1
  # GET /employer_pfs/1.json
  def show
  end

  # GET /employer_pfs/new
  def new
    @employer_pf = EmployerPf.new
  end

  # GET /employer_pfs/1/edit
  def edit
  end

  # POST /employer_pfs
  # POST /employer_pfs.json
  def create
    @employer_pf = EmployerPf.new(employer_pf_params)

    respond_to do |format|
      if @employer_pf.save
        format.html { redirect_to @employer_pf, notice: 'Employer pf was successfully created.' }
        format.json { render :show, status: :created, location: @employer_pf }
      else
        format.html { render :new }
        format.json { render json: @employer_pf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employer_pfs/1
  # PATCH/PUT /employer_pfs/1.json
  def update
    respond_to do |format|
      if @employer_pf.update(employer_pf_params)
        format.html { redirect_to @employer_pf, notice: 'Employer pf was successfully updated.' }
        format.json { render :show, status: :ok, location: @employer_pf }
      else
        format.html { render :edit }
        format.json { render json: @employer_pf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employer_pfs/1
  # DELETE /employer_pfs/1.json
  def destroy
    @employer_pf.destroy
    respond_to do |format|
      format.html { redirect_to employer_pfs_url, notice: 'Employer pf was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employer_pf
      @employer_pf = EmployerPf.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employer_pf_params
      params.require(:employer_pf).permit(:base_component, :percentage, :effective_from, :effective_to, :is_active, :is_confirm)
    end
end

class PfEmployersController < ApplicationController
  before_action :set_pf_employer, only: [:show, :edit, :update, :destroy]

  # GET /pf_employers
  # GET /pf_employers.json
  def index
   
  end

  # GET /pf_employers/1
  # GET /pf_employers/1.json
  def show
  end

  # GET /pf_employers/new
  def new
    @pf_employer = PfEmployer.new
    @pf_employers = PfEmployer.all
  end

  # GET /pf_employers/1/edit
  def edit
  end

  # POST /pf_employers
  # POST /pf_employers.json
  def create
   components = params[:components]
    str = ''
    i = 0
    components.try(:each) do |c|
      str = if i == 0
              c.to_s
            else
              str.to_s + ',' + c.to_s
            end
      i += 1
    end

    @pf_employer = PfEmployer.new(pf_employer_params)
    @pf_employer.base_component = str
    @pf_employers = PfEmployer.all
    @pf_employer.save
    @pf_employer = PfEmployer.new
    end


  # PATCH/PUT /pf_employers/1
  # PATCH/PUT /pf_employers/1.json
  def update
    components = params[:components]
    str = ''
    i = 0
    components.try(:each) do |c|
      str = if i == 0
              c.to_s
            else
              str.to_s + ',' + c.to_s
            end
      i += 1
    end
    @pf_employer.base_component = str
    @pf_employer.update(pf_employer_params)
    @pf_employers = PfEmployer.all
    @pf_employer = PfEmployer.new

  end

  # DELETE /pf_employers/1
  # DELETE /pf_employers/1.json
  def destroy
    @pf_employer.destroy
    @pf_employer = PfEmployer.new
    @pf_employers = PfEmployer.all  
  end

   def is_confirm
    @pf_employer = PfEmployer.find(params[:pf_employer])
    PfEmployer.find(@pf_employer.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_pf_employer_path
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

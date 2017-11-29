class EsicEmployersController < ApplicationController
  before_action :set_esic_employer, only: [:show, :edit, :update, :destroy]

  # GET /esic_employers
  # GET /esic_employers.json
  def index
    
  end

  # GET /esic_employers/1
  # GET /esic_employers/1.json
  def show
  end

  # GET /esic_employers/new
  def new
    @esic_employer = EsicEmployer.new
    @esic_employers = EsicEmployer.all
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="PayrollSetup"
    session[:active_tab2] ="EmployerMaster"
  end

  # GET /esic_employers/1/edit
  def edit
  end

  # POST /esic_employers
  # POST /esic_employers.json
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

    @esic_employer = EsicEmployer.new(esic_employer_params)
    @esic_employer.base_component = str
    @esic_employers = EsicEmployer.all
    @esic_employer.save
    @esic_employer = EsicEmployer.new
    end

  # PATCH/PUT /esic_employers/1
  # PATCH/PUT /esic_employers/1.json
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
    @esic_employer.base_component = str
    @esic_employer.update(esic_employer_params)
    @esic_employers = EsicEmployer.all
    @esic_employer = EsicEmployer.new

  end

  # DELETE /esic_employers/1
  # DELETE /esic_employers/1.json
  def destroy
    @esic_employer.destroy
    @esic_employer = EsicEmployer.new
    @esic_employers = EsicEmployer.all
  end

  def is_confirm
    @esic_employer = EsicEmployer.find(params[:esic_employer])
    EsicEmployer.find(@esic_employer.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_esic_employer_path
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

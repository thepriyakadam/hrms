class BonusEmployersController < ApplicationController
  before_action :set_bonus_employer, only: [:show, :edit, :update, :destroy]

  # GET /bonus_employers
  # GET /bonus_employers.json
  def index
    
  end

  # GET /bonus_employers/1
  # GET /bonus_employers/1.json
  def show
  end

  # GET /bonus_employers/new
  def new
    @bonus_employer = BonusEmployer.new
    @bonus_employers = BonusEmployer.all
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="PayrollSetup"
    session[:active_tab2] ="EmployerMaster"
  end

  # GET /bonus_employers/1/edit
  def edit
  end

  # POST /bonus_employers
  # POST /bonus_employers.json
  def create
   components = params[:components]
    str = ''
    i = 0
    components.each do |c|
      str = if i == 0
              c.to_s
            else
              str.to_s + ',' + c.to_s
            end
      i += 1
    end

    @bonus_employer = BonusEmployer.new(bonus_employer_params)
    @bonus_employer.base_component = str
    @bonus_employers = BonusEmployer.all
    @bonus_employer.save
    @bonus_employer = BonusEmployer.new
    end

  # PATCH/PUT /bonus_employers/1
  # PATCH/PUT /bonus_employers/1.json
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
    @bonus_employer.base_component = str
    @bonus_employer.update(bonus_employer_params)
    @bonus_employers = BonusEmployer.all
    @bonus_employer = BonusEmployer.new

  end


  # DELETE /bonus_employers/1
  # DELETE /bonus_employers/1.json
  def destroy
    @bonus_employer.destroy
    @bonus_employer = BonusEmployer.new
    @bonus_employers = BonusEmployer.all
  end

  def is_confirm
    @bonus_employer = BonusEmployer.find(params[:bonus_employer])
    BonusEmployer.find(@bonus_employer.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_bonus_employer_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bonus_employer
      @bonus_employer = BonusEmployer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bonus_employer_params
      params.require(:bonus_employer).permit(:base_component, :limit_amount, :percentage, :effective_from, :effective_to, :is_active, :is_confirm)
    end
end

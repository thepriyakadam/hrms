class SkillsetsController < ApplicationController
  before_action :set_skillset, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /skillsets
  # GET /skillsets.json
  def index
    @skillsets = Skillset.all
  end

  # GET /skillsets/1
  # GET /skillsets/1.json
  def show
  end

  # GET /skillsets/new
  def new
    @skillset = Skillset.new
  end

  # GET /skillsets/1/edit
  def edit
    @employee = @skillset.employee
  end

  # POST /skillsets
  # POST /skillsets.json
  def create
    @employee = Employee.find(params[:skillset][:employee_id])
    @skillset = Skillset.new(skillset_params)
    ActiveRecord::Base.transaction do
      respond_to do |format|
        if @skillset.save
          len = params['skillset'].length - 2
          for i in 2..len
            Skillset.create(employee_id: params['skillset']['employee_id'], name: params['skillset'][i.to_s]['name'], skill_level: params['skillset'][i.to_s]['skill_level'])
          end
          @skillsets = @employee.skillsets
        EmployeeMailer.skillset_create(@employee).deliver_now
          flash[:notice] = 'skillset was successfully created'
          format.html { redirect_to @skillset, notice: 'Skillset was successfully created.' }
          format.json { render :show, status: :created, location: @skillset }
          format.js { @flag = true }
        else
          format.html { render :new }
          format.json { render json: @skillset.errors, status: :unprocessable_entity }
          format.js { @flag = false }
      end
      end
    end
  end

  # PATCH/PUT /skillsets/1
  # PATCH/PUT /skillsets/1.json
  def update
    @employee = Employee.find(params['skillset']['employee_id'])
    respond_to do |format|
      if @skillset.update(skillset_params)
        # format.html { redirect_to @skillset, notice: 'Skillset was successfully updated.' }
        # format.json { render :show, status: :ok, location: @skillset }
        @skillsets = @employee.skillsets
        format.js { @flag = true }
      else
        # format.html { render :edit }
        # format.json { render json: @skillset.errors, status: :unprocessable_entity }
        format.js { @flag = false }
      end
    end
  end

  def import_xl
    @skillsets = Skillset.all
    respond_to do |format|
    format.html
    format.csv { send_data @skillsets.to_csv }
    format.xls
     session[:active_tab] = "import"
   end   
  end

  def import
    # byebug
    Skillset.import(params[:file])
    redirect_to root_url, notice: "File imported."
  end
  # DELETE /skillsets/1
  # DELETE /skillsets/1.json
  def destroy
    @skillset.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Skillset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_skillset
    @skillset = Skillset.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def skillset_params
    params.require(:skillset).permit(:employee_id, :name, :skill_level)
  end
end

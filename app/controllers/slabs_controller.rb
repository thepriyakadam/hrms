class SlabsController < ApplicationController
  before_action :set_slab, only: [:show, :edit, :update, :destroy]

  # GET /slabs
  # GET /slabs.json
  def index
    @slabs = Slab.all
  end

  # GET /slabs/1
  # GET /slabs/1.json
  def show
  end

  # GET /slabs/new
  def new
    @slab = Slab.new
    @slabs = Slab.all
  end

  # GET /slabs/1/edit
  def edit
  end

  # POST /slabs
  # POST /slabs.json
  def create
    @slab = Slab.new(slab_params)
    @slabs = Slab.all

    respond_to do |format|
      if @slab.save
        @id = @slab.id.to_i - 1
        @previous_slab = Slab.find_by(id: @id)
        if @previous_slab.nil?
          texable_amount = @slab.try(:to)
        else
          texable_amount = @slab.try(:to) - @previous_slab.try(:to)
        end

        @slab.update(texable_amount: texable_amount)
        @slab = Slab.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Slab Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /slabs/1
  # PATCH/PUT /slabs/1.json
  def update
    @slab.update(slab_params)
    @slab = Slab.new
    @slabs = Slab.all
  end

  # DELETE /slabs/1
  # DELETE /slabs/1.json
  def destroy
    @slab.destroy
    @slabs = Slab.all
  end

  def employee_list
    if current_user.class == Member
      if current_user.role.name == 'GroupAdmin'
        @employees = Employee.all
      elsif current_user.role.name == 'Admin'
        @employees = Employee.where(company_id: current_user.company_location.company_id)
      elsif current_user.role.name == 'Branch'
        @employees = Employee.where(company_location_id: current_user.company_location_id)
      elsif current_user.role.name == 'HOD'
        @employees = Employee.where(department_id: current_user.department_id)
      elsif current_user.role.name == 'Supervisor'
        @emp = Employee.find(current_user.employee_id)
        @employees = @emp.subordinates
      else current_user.role.name == 'Employee'
        @employees = Employee.where(id: current_user.employee_id)
        redirect_to home_index_path
      end
    else
      @employees = Employee.all
    end
  end

  def apply_tds
    employee = Employee.find(params[:employee_id])
    @current_template = EmployeeTemplate.where(employee_id: employee.id, is_active: true).take
    @employee_salary_templates = @current_template.employee_salary_templates
    
    @ctc = @employee_salary_templates.sum(:annual_amount)
    @slabs = Slab.all
      slab_value = 0

    @slabs.each do |s|
      if @ctc.to_d >= s.from.to_d && @ctc.to_d <= s.to.to_d
        @value = @ctc.to_d - s.texable_amount.to_d
        last_value = (@value * s.percentage) / 100
        last_value1 = slab_value + last_value
        #final = last_value + previous_value
        flash[:notice] = "Successfully created!"
      else
        value = (s.texable_amount * s.percentage) / 100
        slab_value = slab_value + value
      end
      slab_value
      last_value1
    end
    last_value1
    slab_value
    redirect_to employee_list_slabs_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slab
      @slab = Slab.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slab_params
      params.require(:slab).permit(:from, :to, :texable_amount, :percentage, :status)
    end
end

class FamiliesController < ApplicationController
  before_action :set_family, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /families
  # GET /families.json
  def index
    @families = Family.all
  end

  # GET /families/1
  # GET /families/1.json
  def show
    @employee = @family.employee
  end

  # GET /families/new
  def new
    @family = Family.new
  end

  # GET /families/1/edit
  def edit
    @form = 'family'
    @employee = @family.employee
  end

  # POST /families
  # POST /families.json

  def create
    @family = Family.new(family_params)
    @employee = Employee.find(params[:family][:employee_id])
    respond_to do |format|
      if @family.save
        EmployeeMailer.family_detail_create(@employee,@family).deliver_now
        format.html { redirect_to @family, notice: 'Asset was successfully created.' }
        format.json { render :show, status: :created, location: @family }
        @families = @employee.families
        format.js { @flag = true }
      else
        format.html { render :new }
        format.json { render json: @family.errors, status: :unprocessable_entity }
        format.js { @flag = false }
      end
    end
  end

  def collect_age
    date_of_birth = params[:date_of_birth]
    todays_date = Date.today
    d = todays_date.to_date - date_of_birth.to_date
    age = d.to_i/365
    @age = age
  end

  #  def create
  #   @family = Family.new(family_params)
  #   @employee = Employee.find(params[:family][:employee_id])
  #   ActiveRecord::Base.transaction do
  #     respond_to do |format|
  #       if @family.save
  #         len = params['family'].length - 4
  #         for i in 2..len
  #           Family.create(employee_id: params['family']['employee_id'],relation_master_id: params['family'][i.to_s]['relation_master_id'],f_name: params['family'][i.to_s]['f_name'],m_name: params['family'][i.to_s]['m_name'],l_name: params['family'][i.to_s]['l_name'],gender: params['family'][i.to_s]['gender'], date_of_birth: params['family'][i.to_s]['date_of_birth'] , age: params['family'][i.to_s]['age'],contact_no: params['family'][i.to_s]['contact_no'], email: params['family'][i.to_s]['email'],current_address: params['family'][i.to_s]['current_address'],marital: params['family'][i.to_s]['marital'],profession: params['family'][i.to_s]['profession'],adhar_no: params['family'][i.to_s]['adhar_no'],pan_no: params['family'][i.to_s]['pan_no'],have_passport: params['family'][i.to_s]['have_passport'],passport_no: params['family'][i.to_s]['passport_no'],passport_issue_date: params['family'][i.to_s]['passport_issue_date'],passport_expiry_date: params['family'][i.to_s]['passport_expiry_date'],medical_claim: params['family'][i.to_s]['medical_claim'],blood_group_id: params['family'][i.to_s]['blood_group_id'],is_handicap: params['family'][i.to_s]['is_handicap'],handicap_type: params['family'][i.to_s]['handicap_type'],religion_id: params['family'][i.to_s]['religion_id'])
  #         end
  #         @families = Family.where(employee_id: @employee.id)
  #         format.html { redirect_to @family, notice: 'Family was successfully created.' }
  #         format.json { render :show, status: :created, location: @family }
  #         format.js { @flag = true }
  #       else
  #         format.html { render :new }
  #         format.json { render json: @family.errors, status: :unprocessable_entity }
  #         format.js { @flag = false }
  #       end
  #     end
  #   end
  # end

  # PATCH/PUT /families/1
  # PATCH/PUT /families/1.json
  def update
    @employee = Employee.find(params['family']['employee_id'])
    respond_to do |format|
      if @family.update(family_params)
        # format.html { redirect_to @family, notice: 'Family was successfully updated.' }
        # format.json { render :show, status: :ok, location: @family }
        @families = @employee.families
        format.js { @flag = true }
      else
        # format.html { render :edit }
        # format.json { render json: @family.errors, status: :unprocessable_entity }
        format.js { @flag = false }
      end
    end
  end

  # DELETE /families/1
  # DELETE /families/1.json
  def destroy
    @family.destroy
    respond_to do |format|
      format.html { redirect_to families_url, notice: 'Family was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

   def import_xl
    @families = Family.all
    respond_to do |format|
    format.html
    format.csv { send_data @families.to_csv }
    format.xls
     session[:active_tab] = "import"
   end   
  end

  def import
    # byebug
    Family.import(params[:file])
    redirect_to root_url, notice: "File imported."
  end

  def ajax_show_handicap_type_textbox
    @value = params[:id]
  end

  def ajax_show_passport_detail_textbox
    @value = params[:id]
  end

  def family_modal
    @family = Family.find(params[:format])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_family
    @family = Family.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def family_params
    params.require(:family).permit(:employee_id, :no_of_member, :f_name, :m_name, :l_name, :date_of_birth, :age, :contact_no, :email, :current_address, :relation, :adhar_no, :pan_no, :passport_no, :medical_claim, :passport_expiry_date, :have_passport, :passport_issue_date, :marital, :blood_group_id, :religion_id, :handicap_type, :is_handicap, :profession, :gender, :relation_master_id)
  end
end

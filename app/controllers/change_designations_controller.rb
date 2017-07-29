class ChangeDesignationsController < ApplicationController
  before_action :set_change_designation, only: [:show, :edit, :update, :destroy]

  # GET /change_designations
  # GET /change_designations.json

  # GET /change_designations/new
  def new
    @change_designation = ChangeDesignation.new
  end

  # GET /change_designations/1/edit
  def edit
  end

  # POST /change_designations
  # POST /change_designations.json
  def create
    # byebug
      @change_designation = ChangeDesignation.new(change_designation_params)
      @employee = params[:change_designation][:employee_id]
      @effective_from = params[:change_designation][:effective_from].to_date
      @employee_designation_id = params[:change_designation][:employee_designation_id]
      @change =  ChangeDesignation.where(employee_id: @employee).last 
      ChangeDesignation.where(id: @change).update_all(effective_to: @effective_from,status: false)  
      ChangeDesignation.create(employee_id: @change_designation.employee_id,effective_from: @effective_from,employee_designation_id: @change_designation.employee_designation_id,status: true,change_by_id: current_user.employee_id)
      @joining_detail = JoiningDetail.find_by_employee_id(@employee)
      @joining_detail.update(employee_designation_id: @employee_designation_id)
      redirect_to employee_list_change_designations_path
      session[:active_tab] = "promotionmanagement"
  end

  def employee_list
    @employees = Employee.where(status: "Active")
    session[:active_tab] = "promotionmanagement"
  end

  def change_designation_history
    @employee = Employee.find(params[:id])
    employees = ChangeDesignation.where(id: @employee)
    @change_designations = ChangeDesignation.where(employee_id: params[:id])
  end

  def modal
    @change_designation = ChangeDesignation.find(params[:format])
  end

  def print_designation
     # @employee = Employee.find(params[:id])
      # @employee1 = EmployeePromotion.where(id: @employee)
      @change_designations = ChangeDesignation.where(employee_id: params[:id])
            respond_to do |f|
            f.js
            f.html
            f.pdf do
              render pdf: 'print_designation',
              layout: 'pdf.html',
              template: 'change_designations/print_designation.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:13,bottom:13,left:13,right:13 }
      end
    end
  end

  def excel_designation
    # @employee = Employee.find(params[:id])

    @change_designations = ChangeDesignation.where(employee_id: params[:id])
    respond_to do |f|
      f.js
      f.xls {render template: 'change_designations/excel_designation.xls.erb'}
      f.html
    end
  end

  def employee_record_detail
    # byebug
    @change_designation = ChangeDesignation.find(params[:format])
    # @change_designations = ChangeDesignation.where(employee_id: params[:id])
     # @change_designation =ChangeDesignation.find(id: @change_designations.id)
    # @employee = Employee.find(params[:id])
    # @change_designations = ChangeDesignation.where(employee_id: params[:id])
    respond_to do |f|
            f.js
            f.html
            f.pdf do
              render pdf: 'employee_record_detail',
              layout: 'pdf.html',
              template: 'change_designations/employee_record_detail.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:13,bottom:13,left:13,right:13 }
      end
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_change_designation
      @change_designation = ChangeDesignation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def change_designation_params
      params.require(:change_designation).permit(:employee_id, :employee_designation_id, :effective_from, :effective_to, :status, :change_by_id)
    end
end

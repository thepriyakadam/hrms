class InvestmentDeclarationsController < ApplicationController
  before_action :set_investment_declaration, only: [:show, :edit, :update, :destroy]

  # GET /investment_declarations
  # GET /investment_declarations.json
  def index
    @investment_declaration = InvestmentDeclaration.new
    @investment_declarations = InvestmentDeclaration.all
    @policy_details = PolicyDetail.all
    @investment_declaration = InvestmentDeclaration.find(params[:investment_declaration_id])
  end

  # GET /investment_declarations/1
  # GET /investment_declarations/1.json
  def show
  end

  # GET /investment_declarations/new
  def new
    @investment_declaration = InvestmentDeclaration.new
    @investment_declarations = InvestmentDeclaration.all
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] = "IncomeTax"
  end

  # GET /investment_declarations/1/edit
  def edit
  end

  # POST /investment_declarations
  # POST /investment_declarations.json

  def create
    @investment_declaration = InvestmentDeclaration.new(investment_declaration_params)
    @investment_declarations = InvestmentDeclaration.all
    if @investment_declaration.save
      @investment_declaration = InvestmentDeclaration.new
      flash[:notice] = 'Investment Declaration is saved Successfully'
    end
    redirect_to new_investment_declaration_path   
  end

  # PATCH/PUT /investment_declarations/1
  # PATCH/PUT /investment_declarations/1.json

  def update
    @investment_declaration.update(investment_declaration_params)
    @investment_declaration = InvestmentDeclaration.new
    @investment_declarations = InvestmentDeclaration.all
    redirect_to new_investment_declaration_path
    flash[:notice] = 'Investment Declaration is Updated Successfully'   
  end

  # DELETE /investment_declarations/1
  # DELETE /investment_declarations/1.json
  def destroy
    @investment_declaration.destroy
    @investment_declaration = InvestmentDeclaration.new
    @investment_declarations = InvestmentDeclaration.all
    #redirect_to investment_declaration_self_services_path
  end

  def modal
    @investment_declaration = InvestmentDeclaration.find(params[:format])
  end
   
 
  def investment_document
    @investment_declaration = InvestmentDeclaration.find(params[:id])
    send_file @investment_declaration.document.path,
              filename: @investment_declaration.document_file_name,
              type: @investment_declaration.document_content_type,
              disposition: 'attachment'
    # path = params[:to]
    # render path
    # render 'show'
  end

  def send_for_approval
    @investment_declaration = InvestmentDeclaration.find(params[:format])
    @investment_declaration.update(status: true)
    flash[:noitice] = "Successfully send for approval!"
    redirect_to investment_declaration_self_services_path
  end

  def cancel_request
    @investment_declaration = InvestmentDeclaration.find(params[:format])
    @investment_declaration.update(status: false)
    flash[:noitice] = "Successfully Cancelled!"
    redirect_to investment_declaration_self_services_path
  end

  def delete_request
    @investment_declaration = InvestmentDeclaration.find(params[:format])
    @investment_declaration.destroy
    flash[:noitice] = "Successfully Destroyed!"
    redirect_to investment_declaration_self_services_path
  end

  def manager_view
    current_login = Employee.find(current_user.employee_id)
    @emp_sub = current_login.indirect_subordinates.pluck(:id)
    @emp_ind_sub = current_login.subordinates.pluck(:id)
    @employee_id = @emp_sub + @emp_ind_sub
    @investment_declarations = InvestmentDeclaration.where(employee_id: @employee_id)
  end

  def approve_declaration_modal
    @investment_declaration = InvestmentDeclaration.find(params[:format])
    #@investment_declaration = InvestmentDeclaration.find_by(id: investment_declaration_id)
  end

  def approve_declaration
    comment = params[:investment_declaration][:comment]
    @investment_declaration = InvestmentDeclaration.find(params[:investment_declaration_id])
    @investment_declaration.update(is_confirm: true,comment: comment)
    flash[:notice] = "Approved!"
    redirect_to investment_declaration_manager_self_services_path
  end

  def reject_declaration_modal
    @investment_declaration = InvestmentDeclaration.find(params[:format])
  end

  def reject_declaration
    comment = params[:comment]
    @investment_declaration = InvestmentDeclaration.find(params[:investment_declaration_id])
    @investment_declaration.update(status: false,comment: comment)
    flash[:alert] = "Rejected!"
    redirect_to investment_declaration_manager_self_services_path
  end

  def self_edit_modal
    @investment_declaration = InvestmentDeclaration.find(params[:format])
  end

  def self_update
    investment_head_id = params[:investment_declaration][:investment_head_id]
    amount = params[:investment_declaration][:amount]
    date = params[:investment_declaration][:date]
    status = params[:investment_declaration][:status]
    document = params[:investment_declaration][:document]

    @investment_declaration = InvestmentDeclaration.find(params[:investment_declaration_id])
    @investment_declaration.update(investment_head_id: investment_head_id,amount: amount,date: date,status: status)
    flash[:notice] = "Updated Successfully!"
    redirect_to investment_declaration_self_services_path
  end

  def datewise_report
  end

  def show_datewise_report
    @from = params[:employee][:from]
    @to = params[:employee][:to]
    @status = params[:employee][:status]
    @investment_declarations = InvestmentDeclaration.where(date: @from.to_date..@to.to_date,is_confirm: @status)
    
    respond_to do |format|
      format.js
      format.html
      format.xls {render template: 'investment_declarations/datewise_report.xls.erb'}
      format.pdf do
        render pdf: 'show_datewise_report',
              layout: 'pdf.html',
              orientation: 'Landscape',
              template: 'investment_declarations/datewise_report.pdf.erb',
              show_as_html: params[:debug].present?,
              margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  def approve_employee_declaration
    @employees = Employee.where(id: InvestmentDeclaration.select(:employee_id))
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] = "IncomeTax"
  end

  def employee_declaration
    @employees = Employee.where.not(id: InvestmentDeclaration.select(:employee_id))
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] = "IncomeTax"
  end

  def add_employee_declaration
    @investment_heads = InvestmentHead.all
    @investment_heads.each do |ih|
      InvestmentDeclaration.create(investment_head_id: ih.id, employee_id: params[:employee_id], amount: 0.0, date: Date.today )
    end
    redirect_to employee_declaration_investment_declarations_path
  end

  def edit_employee_declaration
    @employee = Employee.find_by(id: current_user.employee_id)
    @sections = Section.all
  end

  def update_employee_declaration
  end

  def leave_travel_assistance_modal
    @leave_travel_assistance = LeaveTravelAssistance.new
  end

  def income_loss_house_property_modal
      @income_loss_house_property = IncomeLossHouseProperty.new
  end

  def houseloan_interest_modal
    @interest_on_housing_loan = InterestOnHousingLoan.new
  end

  def medicle_reimbursement_modal
    @medicle_reimbursement = MedicleReimbursement.new
   end

   def housing_rent_modal
    @housing_rent = HousingRent.new
   end

  def policy_details_modal
    @policy_detail = PolicyDetail.new
    # @investment_declaration = InvestmentDeclaration.find(params[:format])
  end

  def leave_travel_assistance_modal
    @leave_travel_assistance = LeaveTravelAssistance.new
  end

  def add_amount_modal
    @investment_declarations = InvestmentDeclaration.new
  end

  def upload_file_modal
    # binding.pry
    @investment_declarations = InvestmentDeclaration.new
  end

  def update_amount
    investment_declaration_id = params[:investment_declaration][:investment_declaration_id]
    amount = params[:investment_declaration][:amount]
    @investment_declarations = InvestmentDeclaration.find(investment_declaration_id)
    @investment_declarations_update = @investment_declarations.update(actual_amt: amount)
    flash[:notice] = "Updated Successfully!"
    redirect_to show_declaration_details_investment_declarations_path(employee_id: @investment_declarations.employee_id)
  end

  # def upload_file_modal
  #   @investment_declarations = InvestmentDeclaration.new
  # end

  def display_declaration_details
     # binding.pry
    # @declaration = params[:id]
    # @investment_declaration = InvestmentDeclaration.where(id: @declaration).take
    @housing_rents = HousingRent.all
    @total_amt = 0
    @housing_rents.each do |rent|
      total = rent.accepted_rent
      @total_amt = @total_amt + total
    end
    @employee = Employee.find_by(id: current_user.employee_id)
    @emp = InvestmentDeclaration.where(employee_id: @employee)
    @sections = Section.all
    @section_code = {}
    @sections.each do |section|
      @section_code[section.code] = @investment_declarations_c = InvestmentDeclaration.select(InvestmentDeclaration.arel_table[Arel.star]).where(Section.arel_table[:code].eq(section.code).and(InvestmentDeclaration.arel_table[:employee_id].eq(@employee))).joins(InvestmentDeclaration.arel_table.join(InvestmentHead.arel_table).on(InvestmentDeclaration.arel_table[:investment_head_id].eq(InvestmentHead.arel_table[:id])).join_sources).joins(InvestmentDeclaration.arel_table.join(Section.arel_table).on(Section.arel_table[:id].eq(InvestmentHead.arel_table[:section_id])).join_sources)
    end
      respond_to do |f|
      f.js
      #f.xls {render template: 'entries/display_dismantl.xls.erb'}
      f.pdf do
      render pdf: 'display_declaration_details',
      layout: 'pdf.html',
      orientation: 'portrait',
      template: 'investment_declarations/display_declaration_details.pdf.erb',
      :page_height      => 1000,
          :dpi              => '300',
          :margin           => {:top    => 10, # default 10 (mm)
                        :bottom => 10,
                        :left   => 10,
                        :right  => 10},
          :show_as_html => params[:debug].present?
      end
    # end
    end
  end

  def show_policy_details
    @policy_details = PolicyDetail.all
  end

  def show_medicle_reimbursement_details
    @medicle_reimbursements = MedicleReimbursement.all
  end

  def show_income_loss_house_property_details
    @income_loss_house_properties = IncomeLossHouseProperty.all
  end

  def show_housingloan_details
    @interest_on_housing_loans = InterestOnHousingLoan.all
  end

  def show_housing_rent_details
    @housing_rents = HousingRent.all
  end

  def update_policy
    @insurer = params[:policy_detail][:insurer]
    @policy_no = params[:policy_detail][:policy_no]
    @relation = params[:policy_detail][:relation]
    @frequency = params[:policy_detail][:frequency]
    @premium_amount = params[:policy_detail][:premium_amount]
    @estimated_annual_amount = params[:policy_detail][:estimated_annual_amount]
    @actual_annual_amount = params[:policy_detail][:actual_annual_amount] 
    @investment_declaration_id = InvestmentDeclaration.find_by(params[:format])
    PolicyDetail.create(investment_declaration_id: @investment_declaration_id,insurer: @insurer,policy_no: @policy_no,relation: @relation,frequency: @frequency,premium_amount: @premium_amount,estimated_annual_amount: @estimated_annual_amount,actual_annual_amount: @actual_annual_amount)
    redirect_to show_employee_declaration_investment_declarations_path
  end

  def document_upload
    # binding.pry
    # byebug
    investment_declaration = InvestmentDeclaration.find(params[:format])
    document = params[:document]
    investment_declaration.update(document: document)
    redirect_to show_employee_declaration_investment_declarations_path
  end

  # def download_emp
  #   @employee_document = EmployeeDocument.find(params[:id])
  #   send_file @employee_document.document.path,
  #             filename: @employee_document.document,
  #             type: @employee_document.document_content_type,
  #             disposition: 'attachment'
  # end

  def investment_download_document
    @investment_declarations = InvestmentDeclaration.find(params[:id])
    send_file @investment_declarations.document.path,
              filename: @investment_declarations.document,
              type: @investment_declarations.document_content_type,
              disposition: 'attachment'
  end

  def show_employee_declaration
    @employee = Employee.find_by(id: current_user.employee_id)
    @emp = InvestmentDeclaration.where(employee_id: @employee)
    @sections = Section.all
 
    @section_code = {}
    @sections.each do |section|
      @section_code[section.code] = @investment_declarations_c = InvestmentDeclaration.select(InvestmentDeclaration.arel_table[Arel.star]).where(Section.arel_table[:code].eq(section.code).and(InvestmentDeclaration.arel_table[:employee_id].eq(@employee))).joins(InvestmentDeclaration.arel_table.join(InvestmentHead.arel_table).on(InvestmentDeclaration.arel_table[:investment_head_id].eq(InvestmentHead.arel_table[:id])).join_sources).joins(InvestmentDeclaration.arel_table.join(Section.arel_table).on(Section.arel_table[:id].eq(InvestmentHead.arel_table[:section_id])).join_sources)
    end
  end

  def show_declaration_details
    @employee = Employee.find_by(id: params[:employee_id]) 
    @emp = InvestmentDeclaration.where(employee_id: @employee)
    @sections = Section.all
 
    @section_code = {}
    @sections.each do |section|
      @section_code[section.code] = @investment_declarations_c = InvestmentDeclaration.select(InvestmentDeclaration.arel_table[Arel.star]).where(Section.arel_table[:code].eq(section.code).and(InvestmentDeclaration.arel_table[:employee_id].eq(@employee))).joins(InvestmentDeclaration.arel_table.join(InvestmentHead.arel_table).on(InvestmentDeclaration.arel_table[:investment_head_id].eq(InvestmentHead.arel_table[:id])).join_sources).joins(InvestmentDeclaration.arel_table.join(Section.arel_table).on(Section.arel_table[:id].eq(InvestmentHead.arel_table[:section_id])).join_sources)
    end  
    
  end


  def approve_declaration_details
    @employee = Employee.find(params[:employee_id]) 
    @emp = InvestmentDeclaration.where(employee_id: @employee)
    @sections = Section.all
 
    @section_code = {}
    @sections.each do |section|
      @section_code[section.code] = @investment_declarations_c = InvestmentDeclaration.select(InvestmentDeclaration.arel_table[Arel.star]).where(Section.arel_table[:code].eq(section.code).and(InvestmentDeclaration.arel_table[:employee_id].eq(@employee))).joins(InvestmentDeclaration.arel_table.join(InvestmentHead.arel_table).on(InvestmentDeclaration.arel_table[:investment_head_id].eq(InvestmentHead.arel_table[:id])).join_sources).joins(InvestmentDeclaration.arel_table.join(Section.arel_table).on(Section.arel_table[:id].eq(InvestmentHead.arel_table[:section_id])).join_sources)
    end 
    # @abc = @section_code
    # # binding.pry 
    # # byebug
    # @abc.each do |section_code, investment_declaration|
      
    #   investment_declaration.each do |investment_declaration|
    #     # investment_declaration.investment_head.try(:description)
    #     investment_declaration.is_approve = true
    #     if (investment_declaration.is_approve == true)
    #       investment_declaration.accepted_amt = investment_declaration.actual_amt
    #     end
    #   end
    # end
    redirect_to show_declaration_details_investment_declarations_path
  end


  def ajax_investment_declaration
    # @investment_declaration = InvestmentDeclaration.find_by(id: @investment_declaration)
    @investment_declaration = InvestmentDeclaration.new
  end

  def employee_declaration
    @employees = Employee.where.not(id: InvestmentDeclaration.select(:employee_id))
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] = "IncomeTax"
  end


  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investment_declaration
      @investment_declaration = InvestmentDeclaration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investment_declaration_params
      params.require(:investment_declaration).permit(:date, :document, :investment_head_id, :amount, :actual_amt, :accepted_amt, :rejected_amt, :employee_id, :status, :comment, :total_amt)
    end
end

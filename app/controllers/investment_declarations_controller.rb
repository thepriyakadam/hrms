class InvestmentDeclarationsController < ApplicationController
  before_action :set_investment_declaration, only: [:show, :edit, :update, :destroy]

  # GET /investment_declarations
  # GET /investment_declarations.json
  def index
    @investment_declaration = InvestmentDeclaration.new
    @investment_declarations = InvestmentDeclaration.all
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
  end
   
  def investment_document
      @investment_declaration = InvestmentDeclaration.find(params[:id])
      send_file @investment_declaration.document.path,
               filename: @investment_declaration.document_file_name,
               type: @investment_declaration.document_content_type,
               disposition: 'attachment'
    
  end
   
  def investment_document2
      @investment_declaration = InvestmentDeclaration.find(params[:id])
      send_file @investment_declaration.document.path,
               filename: @investment_declaration.document_file_name,
               type: @investment_declaration.document_content_type,
               disposition: 'attachment'
    
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investment_declaration
      @investment_declaration = InvestmentDeclaration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investment_declaration_params
      params.require(:investment_declaration).permit(:date, :document, :investment_head_id, :amount, :employee_id, :status)
    end
end

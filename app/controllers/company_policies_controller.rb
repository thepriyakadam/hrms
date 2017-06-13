class CompanyPoliciesController < ApplicationController
  before_action :set_company_policy, only: [:edit, :update, :destroy]

  # def index
  #   @company_policies = CompanyPolicy.all
  #   @company_policy = CompanyPolicy.new
  #   session[:active_tab] = 'company'
  # end

  def new
    @company_policies = CompanyPolicy.group("policy_type_id")
    @company_policy = CompanyPolicy.new
    session[:active_tab] = "InformationManagement"
    session[:active_tab1] = "Events" 
  end

   # GET /about_bosses/new
  # def new
  #   @company_policy = CompanyPolicy.new
  #   @company_policies = CompanyPolicy.all
  # end

	def create
     @company_policy = CompanyPolicy.new(company_policy_params)
     @company_policies = CompanyPolicy.all
      if @company_policy.save
        @company_policy = CompanyPolicy.new
      else
      end
      flash[:notice] = 'Company Policy saved Successfully.' 
      redirect_to new_company_policy_path
        
  end

  def active_policies_list
    @company_policies = CompanyPolicy.all
  end

  def policy_type_detail
      @company_policy = CompanyPolicy.find(params[:company_policy_id])
      policy_type = @company_policy.policy_type
      @company_policies = CompanyPolicy.where(policy_type: policy_type)

  end

  def policy_type_dashboard
     @company_policy = CompanyPolicy.find(params[:company_policy_id])
      policy_type = @company_policy.policy_type
      @company_policies = CompanyPolicy.where(policy_type: policy_type)
  end

	def edit
	end

 def update
    @company_policy.update(company_policy_params)
    @company_policies = CompanyPolicy.all
    @company_policy = CompanyPolicy.new
    redirect_to new_company_policy_path
    flash[:notice] = 'Company Policy Updated Successfully' 
  end

	 def destroy
	    @company_policy.destroy
	    @company_policies = CompanyPolicy.all
	  end
   
  def download_docs
    @company_policy = CompanyPolicy.find(params[:id])
    if File.exist?(@company_policy.document.path)
    send_file @company_policy.document.path,
              filename: @company_policy.document,
              type: @company_policy.document_content_type,
              disposition: 'attachment',
              disposition: 'inline'
    else
    flash[:alert] = "No file found Please contact to Admin!"
    redirect_to root_url
    end
  end

	private

    def set_company_policy
      @company_policy = CompanyPolicy.find(params[:id])
	  end

    def company_policy_params
      params.require(:company_policy).permit(:name, :effective_from, :effective_to, :status, :document, :description,:policy_type_id)
	  end
end
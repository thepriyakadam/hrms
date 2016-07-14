class CompanyPoliciesController < ApplicationController
  before_action :set_company_policy, only: [:edit, :update, :destroy]

  def index
    @company_policies = CompanyPolicy.all
    @company_policy = CompanyPolicy.new
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
      end
      flash[:notice] = 'Company Policy saved Successfully.' 
      redirect_to company_policies_path
        
  end

  def active_policies_list
    @company_policies = CompanyPolicy.all
  end

	def edit
	end

 def update
    @company_policy.update(company_policy_params)
    @company_policies = CompanyPolicy.all
    @company_policy = CompanyPolicy.new
    redirect_to company_policies_path
  end

	 def destroy
	    @company_policy.destroy
	    @company_policies = CompanyPolicy.all
	  end
   
   def download_docs
    @company_policy = CompanyPolicy.find(params[:id])
    send_file @company_policy.document.path,
              filename: @company_policy.document,
              type: @company_policy.document_content_type,
              disposition: 'attachment'
  end

	private

    def set_company_policy
      @company_policy = CompanyPolicy.find(params[:id])
	  end

    def company_policy_params
      params.require(:company_policy).permit(:name, :effective_from, :effective_to, :status, :document, :description)
	  end
end
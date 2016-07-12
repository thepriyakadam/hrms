class CompanyPoliciesController < ApplicationController
  before_action :set_company_policy, only: [:edit, :update, :destroy]

  def index
    @company_policies = CompanyPolicy.all
    @company_policy = CompanyPolicy.new
  end

   # GET /about_bosses/new
  def new
    @company_policy = CompanyPolicy.new
    @company_policies = CompanyPolicy.all
  end

	 def create
      @company_policy = CompanyPolicy.new(company_policy_params)
      if @company_policy.save
        @company_policy = CompanyPolicy.new
      end
      redirect_to company_policies_path
      flash[:notice] = 'Company Policy was saved Successfully'   
  end

	def edit
	end

	def update
	    if @company_policy.update(company_policy_params)
	    @company_policies = CompanyPolicy.all
	    redirect_to company_policies_path
	    flash[:notice] = 'Company Policy was updated Successfully'   
    end
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
      params.require(:company_policy).permit(:name, :effective_from, :effective_to, :status, :document)
	  end
end
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
	    @company_policies = CompanyPolicy.all
			@flag = true
		else
			@flag = false
		end
	end

	def edit
	end

	def update
		if @company_policy.update(company_policy_params)
     @company_policy = CompanyPolicy.new
     @company_policies = CompanyPolicy.all
			@flag = true
		else
			@flag = false
		end
	end

	def destroy
    @company_policy.destroy
    @company_policies = CompanyPolicy.all
  end
	private

    def set_company_policy
      @company_policy = CompanyPolicy.find(params[:id])
	  end

    def company_policy_params
      params.require(:company_policy).permit(:name, :effective_from, :effective_to, :status, :document)
	  end
end
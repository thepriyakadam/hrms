class PolicyTypesController < ApplicationController
  before_action :set_policy_type, only: [:show, :edit, :update, :destroy]

  # GET /policy_types
  # GET /policy_types.json
  def index
    @policy_type = PolicyType.new
    @policy_types = PolicyType.all
  end

  # GET /policy_types/1
  # GET /policy_types/1.json
  def show
  end

  # GET /policy_types/new
  def new
    @policy_type = PolicyType.new
    @policy_types = PolicyType.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="CompanyType"
  end

  # GET /policy_types/1/edit
  def edit
  end

  # POST /policy_types
  # POST /policy_types.json
  def create
    @policy_type = PolicyType.new(policy_type_params)
    @policy_types = PolicyType.all
    respond_to do |format|
      if @policy_type.save
         @policy_type = PolicyType.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Policy Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /policy_types/1
  # PATCH/PUT /policy_types/1.json
  def update
    @policy_type.update(policy_type_params)
    @policy_types = PolicyType.all
    @policy_type = PolicyType.new

  end

  # DELETE /policy_types/1
  # DELETE /policy_types/1.json
  def destroy
    @policy_type.destroy
    @policy_types = PolicyType.all
  end

  def modal
    @policy_type = PolicyType.find(params[:format])
  end

  
  def policy_type_master
      @policy_types = PolicyType.all
      respond_to do |f|
      f.js
      f.xls {render template: 'policy_types/policy_type_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'policy_type_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'policy_types/policy_type_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
  end

  def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_policy_types_path
      else
     PolicyType.import(params[:file])
     redirect_to new_policy_type_path, notice: "File imported."
     end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_policy_type
      @policy_type = PolicyType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def policy_type_params
      params.require(:policy_type).permit(:code, :name, :description, :is_active)
    end
end

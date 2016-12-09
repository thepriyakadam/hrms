class IssueTypesController < ApplicationController
  before_action :set_issue_type, only: [:show, :edit, :update, :destroy]

  
  # GET /issue_types/new
  def new
    @issue_type = IssueType.new
    @issue_types = IssueType.all
    session[:active_tab] = "issuetracker"
    session[:active_tab1] = "issueprocess1"
  end

  # GET /issue_types/1/edit
  def edit
  end

  # POST /issue_types
  # POST /issue_types.json
  def create
    @issue_type = IssueType.new(issue_type_params)
    @issue_types = IssueType.all
    @issue_type.save
    @issue_type = IssueType.new
    redirect_to new_issue_type_path
    flash[:notice] = "Saved Successfully"
  end

  # PATCH/PUT /issue_types/1
  # PATCH/PUT /issue_types/1.json
  def update
    @issue_type.update(issue_type_params)
    @issue_types = IssueType.all
    @issue_type = IssueType.new 
    redirect_to new_issue_type_path
    flash[:notice] = "Updated Successfully"
       
  end

  # DELETE /issue_types/1
  # DELETE /issue_types/1.json
  def destroy
    @issue_type.destroy
    @issue_types = IssueType.all
  end

   def is_confirm
    @issue_type = IssueType.find(params[:issue_type])
    IssueType.find(@issue_type.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to new_issue_type_path
   end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue_type
      @issue_type = IssueType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_type_params
      params.require(:issue_type).permit(:name, :status, :is_confirm)
    end
end

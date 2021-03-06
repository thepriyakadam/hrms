class JoiningChecklistMastersController < ApplicationController
  before_action :set_joining_checklist_master, only: [:show, :edit, :update, :destroy]

  # GET /joining_checklist_masters
  # GET /joining_checklist_masters.json
  def index
    @joining_checklist_master = JoiningChecklistMaster.new
    @joining_checklist_masters = JoiningChecklistMaster.all
  end

  # GET /joining_checklist_masters/1
  # GET /joining_checklist_masters/1.json
  def show
  end

  # GET /joining_checklist_masters/new
  def new
    @joining_checklist_master = JoiningChecklistMaster.new
    @joining_checklist_masters = JoiningChecklistMaster.all
    session[:active_tab] = "GlobalSetup"
    session[:active_tab1] = "OnBording"
  end

  # GET /joining_checklist_masters/1/edit
  def edit
  end

  # POST /joining_checklist_masters
  # POST /joining_checklist_masters.json
  def create
   @joining_checklist_master = JoiningChecklistMaster.new(joining_checklist_master_params)
    @joining_checklist_masters = JoiningChecklistMaster.all
    respond_to do |format|
      if @joining_checklist_master.save
         @joining_checklist_master = JoiningChecklistMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Joining Checklist Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /joining_checklist_masters/1
  # PATCH/PUT /joining_checklist_masters/1.json
  def update
    @joining_checklist_master.update(joining_checklist_master_params)
     @joining_checklist_masters = JoiningChecklistMaster.all
    @joining_checklist_master = JoiningChecklistMaster.new
   
        
  end

  # DELETE /joining_checklist_masters/1
  # DELETE /joining_checklist_masters/1.json
  def destroy
    @joining_checklist_master.destroy
    @joining_checklist_masters = JoiningChecklistMaster.all
  end

   def joining_checklist_master
      @joining_checklist_masters = JoiningChecklistMaster.all
      respond_to do |f|
      f.js
      f.xls {render template: 'joining_checklist_masters/joining_checklist_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'joining_checklist_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'joining_checklist_masters/joining_checklist_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
  end

  def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_joining_checklist_masters_path
      else
     JoiningChecklistMaster.import(params[:file])
     redirect_to new_joining_checklist_master_path, notice: "File imported."
     end
  end

  def set_checklist
    @employees = Employee.where(status: "Active")
    @employees.each do |e|
      @joining_checklist_masters = JoiningChecklistMaster.where(status: true)
      @joining_checklist_masters.each do |jc|
        if EmployeeJcList.exists?(joining_checklist_master_id: jc.id,employee_id: e.id)
        else
          EmployeeJcList.create(joining_checklist_master_id: jc.id,employee_id: e.id,status: false)
          #EmployeeMailer.employee_create(e).deliver_now
          flash[:notice] = "Successfully Added!"
        end
      end#do |jc|
    end#do |e|
    redirect_to new_joining_checklist_master_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_joining_checklist_master
      @joining_checklist_master = JoiningChecklistMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def joining_checklist_master_params
      params.require(:joining_checklist_master).permit(:code, :name, :description, :status)
    end
end

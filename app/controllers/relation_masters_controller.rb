class RelationMastersController < ApplicationController
  before_action :set_relation_master, only: [:show, :edit, :update, :destroy]

  # GET /relation_masters
  # GET /relation_masters.json
  def index
    @relation_masters = RelationMaster.all
  end

  # GET /relation_masters/1
  # GET /relation_masters/1.json
  def show
  end

  # GET /relation_masters/new
  def new
    @relation_master = RelationMaster.new
    @relation_masters = RelationMaster.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="EmployeeProfile"
  end

  # GET /relation_masters/1/edit
  def edit
  end

  # POST /relation_masters
  # POST /relation_masters.json
  def create
    @relation_master = RelationMaster.new(relation_master_params)

      if @relation_master.save
        @flag = true
        @relation_master = RelationMaster.new
        @relation_masters = RelationMaster.all
      else
         @flag = false
      end
  end

  # PATCH/PUT /relation_masters/1
  # PATCH/PUT /relation_masters/1.json
  def update
      if @relation_master.update(relation_master_params)
        @flag = true
        @relation_master = RelationMaster.new
        @relation_masters = RelationMaster.all
      else
        @flag = false
      end
  end

  # DELETE /relation_masters/1
  # DELETE /relation_masters/1.json
  def destroy
    @relation_master.destroy
    @relation_masters = RelationMaster.all
    redirect_to new_relation_master_path
  end

  def relation_master
     @relation_masters = RelationMaster.all
     respond_to do |f|
      f.js
      f.xls {render template: 'relation_masters/relation_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' relation_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'relation_masters/relation_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
    end

  def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_relation_masters_path
      else
     RelationMaster.import(params[:file])
     redirect_to new_relation_master_path, notice: "File imported."
     end
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relation_master
      @relation_master = RelationMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relation_master_params
      params.require(:relation_master).permit(:is_confirm,:code, :name, :description)
    end
end

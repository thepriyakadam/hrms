class ExpenceOpestionsController < ApplicationController
  before_action :set_expence_opestion, only: [:show, :edit, :update, :destroy]

  # GET /expence_opestions
  # GET /expence_opestions.json
  def index
    @expence_opestions = ExpenceOpestion.all
    @expence_opestion = ExpenceOpestion.new

    respond_to do |f|
      f.js
      f.xls {render template: 'expence_opestions/expence_opestions_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'department_type_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'expence_opestions/expence_opestions_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
      end
    end
  end

  # GET /expence_opestions/1
  # GET /expence_opestions/1.json
  def show
  end

  # GET /expence_opestions/new
  def new
    @expence_opestions = ExpenceOpestion.all
    @expence_opestion = ExpenceOpestion.new
  end

  # GET /expence_opestions/1/edit
  def edit
  end

  # POST /expence_opestions
  # POST /expence_opestions.json
  def create
    # @expence_opestion = ExpenceOpestion.new(expence_opestion_params)

    # respond_to do |format|
    #   if @expence_opestion.save
    #     format.html { redirect_to @expence_opestion, notice: 'Expence opestion was successfully created.' }
    #     format.json { render :show, status: :created, location: @expence_opestion }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @expence_opestion.errors, status: :unprocessable_entity }
    #   end
    # end


    @expence_opestion = ExpenceOpestion.new(expence_opestion_params)
    @expence_opestions = ExpenceOpestion.all
    respond_to do |format|
      if @expence_opestion.save
        @expence_opestion = ExpenceOpestion.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Expence Opestion Type Already Exist.'
        format.js { @flag = false }
        end
    end
  end

  # PATCH/PUT /expence_opestions/1
  # PATCH/PUT /expence_opestions/1.json
  def update
    # respond_to do |format|
    #   if @expence_opestion.update(expence_opestion_params)
    #     format.html { redirect_to @expence_opestion, notice: 'Expence opestion was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @expence_opestion }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @expence_opestion.errors, status: :unprocessable_entity }
    #   end
    # end
    @expence_opestion.update(expence_opestion_params)
    @expence_opestions = ExpenceOpestion.all
    @expence_opestion = ExpenceOpestion.new
  end

  # DELETE /expence_opestions/1
  # DELETE /expence_opestions/1.json
  def destroy
    # @expence_opestion.destroy
    # respond_to do |format|
    #   format.html { redirect_to expence_opestions_url, notice: 'Expence opestion was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
    @expence_opestion.destroy
    @expence_opestions = ExpenceOpestion.all
  end

  def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_expence_opestions_path
      else
     ExpenceOpestion.import(params[:file])
     redirect_to expence_opestions_path, notice: "File imported."
     end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expence_opestion
      @expence_opestion = ExpenceOpestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expence_opestion_params
      params.require(:expence_opestion).permit(:employee_grade_id, :code, :name, :description, :status)
    end
end

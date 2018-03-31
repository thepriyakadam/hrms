class InductionTemplatesController < ApplicationController
  before_action :set_induction_template, only: [:show, :edit, :update, :destroy]

  # GET /induction_templates
  # GET /induction_templates.json
  def index
    @induction_templates = InductionTemplate.all
  end

  # GET /induction_templates/1
  # GET /induction_templates/1.json
  def show
  end

  # GET /induction_templates/new
  def new
    @induction_template = InductionTemplate.new
  end

  # GET /induction_templates/1/edit
  def edit
  end

  # POST /induction_templates
  # POST /induction_templates.json
  # def create
  #   @induction_template = InductionTemplate.new(induction_template_params)

  #   respond_to do |format|
  #     if @induction_template.save
  #       format.html { redirect_to @induction_template, notice: 'Induction template was successfully created.' }
  #       format.json { render :show, status: :created, location: @induction_template }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @induction_template.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    @induction_template = InductionTemplate.new(induction_template_params)

    ActiveRecord::Base.transaction do
      respond_to do |format|
        if @induction_template.save
          len = params['induction_template'].length - 6
          for i in 2..len
            InductionTemplate.create(template_no: params['induction_template']['template_no'], description: params['induction_template'][i.to_s]['description'], activity: params['induction_template'][i.to_s]['activity'], day: params['induction_template'][i.to_s]['day'], duration: params['induction_template'][i.to_s]['duration'], employee_id: params['induction_template'][i.to_s]['employee_id'])
          end
          format.html { redirect_to @induction_template, notice: 'Induction Template was successfully created.' }
          format.json { render :show, status: :created, location: @induction_template }
          format.js { @flag = true }
        else
          format.html { render :new }
          format.json { render json: @induction_template.errors, status: :unprocessable_entity }
          format.js { @flag = false }
        end
      end
    end
  end
  # PATCH/PUT /induction_templates/1
  # PATCH/PUT /induction_templates/1.json
  def update
    respond_to do |format|
      if @induction_template.update(induction_template_params)
        format.html { redirect_to @induction_template, notice: 'Induction template was successfully updated.' }
        format.json { render :show, status: :ok, location: @induction_template }
      else
        format.html { render :edit }
        format.json { render json: @induction_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /induction_templates/1
  # DELETE /induction_templates/1.json
  def destroy
    @induction_template.destroy
    respond_to do |format|
      format.html { redirect_to induction_templates_url, notice: 'Induction template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_induction_template
      @induction_template = InductionTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def induction_template_params
      params.require(:induction_template).permit(:template_no, :description, :activity, :day, :duration, :employee_id)
    end
end

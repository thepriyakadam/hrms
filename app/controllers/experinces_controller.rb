class ExperincesController < ApplicationController
  before_action :set_experince, only: [:show, :edit, :update, :destroy]

  # GET /experinces
  # GET /experinces.json
  def index
    @experinces = Experince.all
  end

  # GET /experinces/1
  # GET /experinces/1.json
  def show
  end

  # GET /experinces/new
  def new
    @experince = Experince.new
  end

  # GET /experinces/1/edit
  def edit
  end

  # POST /experinces
  # POST /experinces.json
  def create
    @experince = Experince.new(experince_params)

    respond_to do |format|
      if @experince.save
        format.html { redirect_to @experince, notice: 'Experince was successfully created.' }
        format.json { render :show, status: :created, location: @experince }
      else
        format.html { render :new }
        format.json { render json: @experince.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experinces/1
  # PATCH/PUT /experinces/1.json
  def update
    respond_to do |format|
      if @experince.update(experince_params)
        format.html { redirect_to @experince, notice: 'Experince was successfully updated.' }
        format.json { render :show, status: :ok, location: @experince }
      else
        format.html { render :edit }
        format.json { render json: @experince.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experinces/1
  # DELETE /experinces/1.json
  def destroy
    @experince.destroy
    respond_to do |format|
      format.html { redirect_to experinces_url, notice: 'Experince was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experince
      @experince = Experince.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experince_params
      params.require(:experince).permit(:employee_id, :no_of_year_experince, :company_name, :designation, :ctc)
    end
end

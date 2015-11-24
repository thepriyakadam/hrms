class LeavAprovedsController < ApplicationController
  before_action :set_leav_aproved, only: [:show, :edit, :update, :destroy]

  # GET /leav_aproveds
  # GET /leav_aproveds.json
  def index
    @leav_aproveds = LeavAproved.all
  end

  # GET /leav_aproveds/1
  # GET /leav_aproveds/1.json
  def show
  end

  # GET /leav_aproveds/new
  def new
    @leav_aproved = LeavAproved.new
  end

  # GET /leav_aproveds/1/edit
  def edit
  end

  # POST /leav_aproveds
  # POST /leav_aproveds.json
  def create
    @leav_aproved = LeavAproved.new(leav_aproved_params)

    respond_to do |format|
      if @leav_aproved.save
        format.html { redirect_to @leav_aproved, notice: 'Leav aproved was successfully created.' }
        format.json { render :show, status: :created, location: @leav_aproved }
      else
        format.html { render :new }
        format.json { render json: @leav_aproved.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leav_aproveds/1
  # PATCH/PUT /leav_aproveds/1.json
  def update
    respond_to do |format|
      if @leav_aproved.update(leav_aproved_params)
        format.html { redirect_to @leav_aproved, notice: 'Leav aproved was successfully updated.' }
        format.json { render :show, status: :ok, location: @leav_aproved }
      else
        format.html { render :edit }
        format.json { render json: @leav_aproved.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leav_aproveds/1
  # DELETE /leav_aproveds/1.json
  def destroy
    @leav_aproved.destroy
    respond_to do |format|
      format.html { redirect_to leav_aproveds_url, notice: 'Leav aproved was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leav_aproved
      @leav_aproved = LeavAproved.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leav_aproved_params
      params.require(:leav_aproved).permit(:employee_leav_request_id, :approved_date)
    end
end

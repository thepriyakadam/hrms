class BonusEmployersController < ApplicationController
  before_action :set_bonus_employer, only: [:show, :edit, :update, :destroy]

  # GET /bonus_employers
  # GET /bonus_employers.json
  def index
    @bonus_employers = BonusEmployer.all
  end

  # GET /bonus_employers/1
  # GET /bonus_employers/1.json
  def show
  end

  # GET /bonus_employers/new
  def new
    @bonus_employer = BonusEmployer.new
  end

  # GET /bonus_employers/1/edit
  def edit
  end

  # POST /bonus_employers
  # POST /bonus_employers.json
  def create
    @bonus_employer = BonusEmployer.new(bonus_employer_params)

    respond_to do |format|
      if @bonus_employer.save
        format.html { redirect_to @bonus_employer, notice: 'Bonus employer was successfully created.' }
        format.json { render :show, status: :created, location: @bonus_employer }
      else
        format.html { render :new }
        format.json { render json: @bonus_employer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bonus_employers/1
  # PATCH/PUT /bonus_employers/1.json
  def update
    respond_to do |format|
      if @bonus_employer.update(bonus_employer_params)
        format.html { redirect_to @bonus_employer, notice: 'Bonus employer was successfully updated.' }
        format.json { render :show, status: :ok, location: @bonus_employer }
      else
        format.html { render :edit }
        format.json { render json: @bonus_employer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bonus_employers/1
  # DELETE /bonus_employers/1.json
  def destroy
    @bonus_employer.destroy
    respond_to do |format|
      format.html { redirect_to bonus_employers_url, notice: 'Bonus employer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bonus_employer
      @bonus_employer = BonusEmployer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bonus_employer_params
      params.require(:bonus_employer).permit(:base_component, :limit_amount, :percentage, :effective_from, :effective_to, :is_active, :is_confirm)
    end
end

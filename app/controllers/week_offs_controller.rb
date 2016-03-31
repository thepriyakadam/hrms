class WeekOffsController < ApplicationController
  before_action :set_week_off, only: [:show, :edit, :update, :destroy]

  # GET /week_offs
  # GET /week_offs.json
  def index
    @week_offs = WeekOff.all
  end

  # GET /week_offs/1
  # GET /week_offs/1.json
  def show
  end

  # GET /week_offs/new
  def new
    @week_off = WeekOff.new
  end

  # GET /week_offs/1/edit
  def edit
  end

  # POST /week_offs
  # POST /week_offs.json
  def create
    @week_off = WeekOff.new(week_off_params)

    respond_to do |format|
      if @week_off.save
        format.html { redirect_to @week_off, notice: 'Week off was successfully created.' }
        format.json { render :show, status: :created, location: @week_off }
      else
        format.html { render :new }
        format.json { render json: @week_off.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /week_offs/1
  # PATCH/PUT /week_offs/1.json
  def update
    respond_to do |format|
      if @week_off.update(week_off_params)
        format.html { redirect_to @week_off, notice: 'Week off was successfully updated.' }
        format.json { render :show, status: :ok, location: @week_off }
      else
        format.html { render :edit }
        format.json { render json: @week_off.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /week_offs/1
  # DELETE /week_offs/1.json
  def destroy
    @week_off.destroy
    respond_to do |format|
      format.html { redirect_to week_offs_url, notice: 'Week off was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_week_off
      @week_off = WeekOff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def week_off_params
      params.require(:week_off).permit(:weekoff_date_range, :employee_id)
    end
end

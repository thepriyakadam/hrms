class LeavingReasonsController < ApplicationController
  before_action :set_leaving_reason, only: [:show, :edit, :update, :destroy]

  # GET /leaving_reasons
  # GET /leaving_reasons.json
  def index
    @leaving_reasons = LeavingReason.all
  end

  # GET /leaving_reasons/1
  # GET /leaving_reasons/1.json
  def show
  end

  # GET /leaving_reasons/new
  def new
    @leaving_reason = LeavingReason.new
  end

  # GET /leaving_reasons/1/edit
  def edit
  end

  # POST /leaving_reasons
  # POST /leaving_reasons.json
  def create
    @leaving_reason = LeavingReason.new(leaving_reason_params)

    respond_to do |format|
      if @leaving_reason.save
        format.html { redirect_to @leaving_reason, notice: 'Leaving reason was successfully created.' }
        format.json { render :show, status: :created, location: @leaving_reason }
      else
        format.html { render :new }
        format.json { render json: @leaving_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leaving_reasons/1
  # PATCH/PUT /leaving_reasons/1.json
  def update
    respond_to do |format|
      if @leaving_reason.update(leaving_reason_params)
        format.html { redirect_to @leaving_reason, notice: 'Leaving reason was successfully updated.' }
        format.json { render :show, status: :ok, location: @leaving_reason }
      else
        format.html { render :edit }
        format.json { render json: @leaving_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leaving_reasons/1
  # DELETE /leaving_reasons/1.json
  def destroy
    @leaving_reason.destroy
    respond_to do |format|
      format.html { redirect_to leaving_reasons_url, notice: 'Leaving reason was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leaving_reason
      @leaving_reason = LeavingReason.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leaving_reason_params
      params.require(:leaving_reason).permit(:code, :name, :description)
    end
end

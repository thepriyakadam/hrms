class VisitorDetailsController < ApplicationController
  before_action :set_visitor_detail, only: [:show, :edit, :update, :destroy]

  # GET /visitor_details
  # GET /visitor_details.json
  def index
    @visitor_details = VisitorDetail.all
  end

  # GET /visitor_details/1
  # GET /visitor_details/1.json
  def show
  end

  # GET /visitor_details/new
  def new
    @visitor_detail = VisitorDetail.new
  end

  # GET /visitor_details/1/edit
  def edit
  end

  # POST /visitor_details
  # POST /visitor_details.json
  def create
    @visitor_detail = VisitorDetail.new(visitor_detail_params)

    respond_to do |format|
      if @visitor_detail.save
        format.html { redirect_to @visitor_detail, notice: 'Visitor detail was successfully created.' }
        format.json { render :show, status: :created, location: @visitor_detail }
      else
        format.html { render :new }
        format.json { render json: @visitor_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visitor_details/1
  # PATCH/PUT /visitor_details/1.json
  def update
    respond_to do |format|
      if @visitor_detail.update(visitor_detail_params)
        format.html { redirect_to @visitor_detail, notice: 'Visitor detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @visitor_detail }
      else
        format.html { render :edit }
        format.json { render json: @visitor_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visitor_details/1
  # DELETE /visitor_details/1.json
  def destroy
    @visitor_detail.destroy
    respond_to do |format|
      format.html { redirect_to visitor_details_url, notice: 'Visitor detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitor_detail
      @visitor_detail = VisitorDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visitor_detail_params
      params.require(:visitor_detail).permit(:name, :age, :contact_no, :email_id, :id_proof, :from, :meet_to_id, :in_time, :out_time, :purpose, :authorized_by_id)
    end
end

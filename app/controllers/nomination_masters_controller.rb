class NominationMastersController < ApplicationController
  before_action :set_nomination_master, only: [:show, :edit, :update, :destroy]

  # GET /nomination_masters
  # GET /nomination_masters.json
  def index
    @nomination_masters = NominationMaster.all
  end

  # GET /nomination_masters/1
  # GET /nomination_masters/1.json
  def show
  end

  # GET /nomination_masters/new
  def new
    @nomination_master = NominationMaster.new
  end

  # GET /nomination_masters/1/edit
  def edit
  end

  # POST /nomination_masters
  # POST /nomination_masters.json
  def create
    @nomination_master = NominationMaster.new(nomination_master_params)

    respond_to do |format|
      if @nomination_master.save
        format.html { redirect_to @nomination_master, notice: 'Nomination master was successfully created.' }
        format.json { render :show, status: :created, location: @nomination_master }
      else
        format.html { render :new }
        format.json { render json: @nomination_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nomination_masters/1
  # PATCH/PUT /nomination_masters/1.json
  def update
    respond_to do |format|
      if @nomination_master.update(nomination_master_params)
        format.html { redirect_to @nomination_master, notice: 'Nomination master was successfully updated.' }
        format.json { render :show, status: :ok, location: @nomination_master }
      else
        format.html { render :edit }
        format.json { render json: @nomination_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nomination_masters/1
  # DELETE /nomination_masters/1.json
  def destroy
    @nomination_master.destroy
    respond_to do |format|
      format.html { redirect_to nomination_masters_url, notice: 'Nomination master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nomination_master
      @nomination_master = NominationMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nomination_master_params
      params.require(:nomination_master).permit(:code, :name, :description)
    end
end

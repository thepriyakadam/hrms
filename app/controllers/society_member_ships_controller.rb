class SocietyMemberShipsController < ApplicationController
  before_action :set_society_member_ship, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /society_member_ships
  # GET /society_member_ships.json
  def index
    @society_member_ships = SocietyMemberShip.all
     session[:active_tab] ="payroll"
     session[:active_tab1] ="montlyamount"
  end

  # GET /society_member_ships/1
  # GET /society_member_ships/1.json
  def show
  end

  # GET /society_member_ships/new
  def new
    @society_member_ship = SocietyMemberShip.new
  end

  # GET /society_member_ships/1/edit
  def edit
  end

  # POST /society_member_ships
  # POST /society_member_ships.json
  def create
    @society_member_ship = SocietyMemberShip.new(society_member_ship_params)

    respond_to do |format|
      if @society_member_ship.save
        format.html { redirect_to @society_member_ship, notice: 'Society member ship was successfully created.' }
        format.json { render :show, status: :created, location: @society_member_ship }
      else
        format.html { render :new }
        format.json { render json: @society_member_ship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /society_member_ships/1
  # PATCH/PUT /society_member_ships/1.json
  def update
    respond_to do |format|
      if @society_member_ship.update(society_member_ship_params)
        format.html { redirect_to @society_member_ship, notice: 'Society member ship was successfully updated.' }
        format.json { render :show, status: :ok, location: @society_member_ship }
      else
        format.html { render :edit }
        format.json { render json: @society_member_ship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /society_member_ships/1
  # DELETE /society_member_ships/1.json
  def destroy
    @society_member_ship.destroy
    respond_to do |format|
      format.html { redirect_to society_member_ships_url, notice: 'Society member ship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def is_confirm
    @society_member_ship = SocietyMemberShip.find(params[:society_member_ship])
    SocietyMemberShip.find(@society_member_ship.id).update(is_confirm: true)
    flash[:notice] = "Confirmed Successfully"
    redirect_to society_member_ships_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_society_member_ship
    @society_member_ship = SocietyMemberShip.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def society_member_ship_params
    params.require(:society_member_ship).permit(:is_active,:is_confirm,:is_society_member, :amount, :employee_id, :start_date)
  end
end

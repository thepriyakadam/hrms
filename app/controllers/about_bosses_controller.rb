class AboutBossesController < ApplicationController
  before_action :set_about_boss, only: [:show, :edit, :update, :destroy]

  # GET /about_bosses
  # GET /about_bosses.json
  def index
    @about_bosses = AboutBoss.all
  end

  # GET /about_bosses/1
  # GET /about_bosses/1.json
  def show
  end

  # GET /about_bosses/new
  def new
    @about_boss = AboutBoss.new
  end

  # GET /about_bosses/1/edit
  def edit
  end

  # POST /about_bosses
  # POST /about_bosses.json
  def create
    @about_boss = AboutBoss.new(about_boss_params)

    respond_to do |format|
      if @about_boss.save
        format.html { redirect_to @about_boss, notice: 'About boss was successfully created.' }
        format.json { render :show, status: :created, location: @about_boss }
      else
        format.html { render :new }
        format.json { render json: @about_boss.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /about_bosses/1
  # PATCH/PUT /about_bosses/1.json
  def update
    respond_to do |format|
      if @about_boss.update(about_boss_params)
        format.html { redirect_to @about_boss, notice: 'About boss was successfully updated.' }
        format.json { render :show, status: :ok, location: @about_boss }
      else
        format.html { render :edit }
        format.json { render json: @about_boss.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /about_bosses/1
  # DELETE /about_bosses/1.json
  def destroy
    @about_boss.destroy
    respond_to do |format|
      format.html { redirect_to about_bosses_url, notice: 'About boss was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_about_boss
      @about_boss = AboutBoss.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def about_boss_params
      params.require(:about_boss).permit(:code, :name, :description, :status)
    end
end

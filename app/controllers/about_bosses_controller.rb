  class AboutBossesController < ApplicationController
  before_action :set_about_boss, only: [:show, :edit, :update, :destroy]

  # GET /about_bosses
  # GET /about_bosses.json
  def index
    @about_boss = AboutBoss.new
    @about_bosses = AboutBoss.all
  end

  # GET /about_bosses/1
  # GET /about_bosses/1.json
  def show
  end

  # GET /about_bosses/new
  def new
    @about_boss = AboutBoss.new
    @about_bosses = AboutBoss.all
    session[:active_tab] = "GlobalSetup"
    session[:active_tab1] = "Resignation"
  end

  # GET /about_bosses/1/edit
  def edit
  end

  # POST /about_bosses
  # POST /about_bosses.json
  def create
    @about_boss = AboutBoss.new(about_boss_params)
    @about_bosses = AboutBoss.all
    respond_to do |format|
      if @about_boss.save
         @about_boss = AboutBoss.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'About Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /about_bosses/1
  # PATCH/PUT /about_bosses/1.json
  def update
    @about_boss.update(about_boss_params)
    @about_bosses = AboutBoss.all
    @about_boss = AboutBoss.new
  end

  # DELETE /about_bosses/1
  # DELETE /about_bosses/1.json
  def destroy
    @about_boss.destroy
    @about_bosses = AboutBoss.all
  end

   def about_boss_master
      @about_bosses = AboutBoss.all
      respond_to do |f|
      f.js
      f.xls {render template: 'about_bosses/about_boss_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: 'about_boss_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'about_bosses/about_boss_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
    end

  def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_about_bosses_path
      else
     AboutBoss.import(params[:file])
     redirect_to new_about_boss_path, notice: "File imported."
     end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_about_boss
      @about_boss = AboutBoss.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def about_boss_params
      params.require(:about_boss).permit(:is_confirm,:code, :name, :description, :status)
    end
end

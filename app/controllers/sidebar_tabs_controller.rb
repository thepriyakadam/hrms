class SidebarTabsController < ApplicationController
  before_action :set_sidebar_tab, only: [:show, :edit, :update, :destroy]

  # GET /sidebar_tabs
  # GET /sidebar_tabs.json
  def index
    @sidebar_tabs = SidebarTab.all
  end

  # GET /sidebar_tabs/1
  # GET /sidebar_tabs/1.json
  def show
  end

  # GET /sidebar_tabs/new
  def new
    @sidebar_tab = SidebarTab.new
  end

  # GET /sidebar_tabs/1/edit
  def edit
  end

  # POST /sidebar_tabs
  # POST /sidebar_tabs.json
  def create
    @sidebar_tab = SidebarTab.new(sidebar_tab_params)

    respond_to do |format|
      if @sidebar_tab.save
        format.html { redirect_to @sidebar_tab, notice: 'Sidebar tab was successfully created.' }
        format.json { render :show, status: :created, location: @sidebar_tab }
      else
        format.html { render :new }
        format.json { render json: @sidebar_tab.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sidebar_tabs/1
  # PATCH/PUT /sidebar_tabs/1.json
  def update
    respond_to do |format|
      if @sidebar_tab.update(sidebar_tab_params)
        format.html { redirect_to @sidebar_tab, notice: 'Sidebar tab was successfully updated.' }
        format.json { render :show, status: :ok, location: @sidebar_tab }
      else
        format.html { render :edit }
        format.json { render json: @sidebar_tab.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sidebar_tabs/1
  # DELETE /sidebar_tabs/1.json
  def destroy
    @sidebar_tab.destroy
    respond_to do |format|
      format.html { redirect_to sidebar_tabs_url, notice: 'Sidebar tab was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sidebar_tab
      @sidebar_tab = SidebarTab.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sidebar_tab_params
      params.require(:sidebar_tab).permit(:name, :status)
    end
end

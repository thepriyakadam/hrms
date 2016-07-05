class SettingMastersController < ApplicationController
  before_action :set_setting_master, only: [:edit, :update, :destroy]

  def index
    @setting_masters = SettingMaster.all
    @setting_master = SettingMaster.new
  end

	def create
    @setting_master = SettingMaster.new(setting_master_params)
		if @setting_master.save
	    @setting_master = SettingMaster.new
	    @setting_masters = SettingMaster.all
			@flag = true
		else
			@flag = false
		end
	end

	def edit
	end

	def update
		if @setting_master.update(setting_master_params)
     @setting_master = SettingMaster.new
     @setting_masters = SettingMaster.all
			@flag = true
		else
			@flag = false
		end
	end

	def destroy
    @setting_master.destroy
    @setting_masters = SettingMaster.all
	end

	private

    def set_setting_master
      @setting_master = SettingMaster.find(params[:id])
	  end

    def setting_master_params
      params.require(:setting_master).permit(:date, :precision, :timeformat, :email)
	  end
end

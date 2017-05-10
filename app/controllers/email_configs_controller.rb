class EmailConfigsController < ApplicationController
  before_action :set_email_config, only: [:edit, :update, :destroy]

  def index
    @email_configs = EmailConfig.all
    @email_config = EmailConfig.new
  end

	def create
    @email_config = EmailConfig.new(email_config_params)
		if @email_config.save
	    @email_config = EmailConfig.new
	    @email_configs = EmailConfig.all
			@flag = true
		else
			@flag = false
		end
	end

	def edit
	end

	def update
		if @email_config.update(email_config_params)
     @email_config = EmailConfig.new
     @email_configs = EmailConfig.all
			@flag = true
		else
			@flag = false
		end
	end

	def destroy
    @email_config.destroy
    @email_configs = EmailConfig.all
	end

	private

    def set_email_config
      @email_config = EmailConfig.find(params[:id])
	  end

    def email_config_params
      params.require(:email_config).permit(:url_host, :url_port, :delivery_method, :address, :port, :username, :pwd, :authentication)
	  end
end

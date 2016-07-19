class Reports::CertificateController < ApplicationController


  def new
  end

  def display_certificate
  	@employee = Employee.find(params[:employee][:id])
  	@character = params[:employee][:certificate]
  end
end

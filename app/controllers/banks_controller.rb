class BanksController < ApplicationController
  before_action :set_bank, only: [:show, :edit, :update, :destroy]

  # GET /banks/new
  def new
    @bank = Bank.new
    @banks = Bank.all
    session[:active_tab] ="GlobalSetup"
    session[:active_tab1] ="CompanyType"
  end

  # GET /banks/1/edit
  def edit
  end

  # POST /banks
  # POST /banks.json
  def create
    @bank = Bank.new(bank_params)
    @banks = Bank.all
    respond_to do |format|
      if @bank.save
        @bank = Bank.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Bank Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /banks/1
  # PATCH/PUT /banks/1.json
  def update
    @bank.update(bank_params)
    @banks = Bank.all
    @bank = Bank.new
  end

  # DELETE /banks/1
  # DELETE /banks/1.json
  def destroy
    @bank.destroy
    @banks = Bank.all
  end

  def bank_master
     @banks = Bank.all
     respond_to do |f|
      f.js
      f.xls {render template: 'banks/bank_master.xls.erb'}
      f.html
      f.pdf do
        render pdf: ' bank_master',
        layout: 'pdf.html',
        orientation: 'Landscape',
        template: 'banks/bank_master.pdf.erb',
        show_as_html: params[:debug].present?
        #margin:  { top:1,bottom:1,left:1,right:1 }
            end
          end
    end

  def import
    file = params[:file]
      if file.nil?
        flash[:alert] = "Please Select File!"
        redirect_to import_xl_banks_path
      else
     Bank.import(params[:file])
     redirect_to import_xl_banks_path, notice: "File imported."
     end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bank
    @bank = Bank.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def bank_params
    params.require(:bank).permit(:is_confirm,:name, :code, :description)
  end
end

class TransactionRecordsController < ApplicationController
  before_action :set_transaction_record, only: [:show, :edit, :update, :destroy]

  # GET /transaction_records
  # GET /transaction_records.json
  def index
    @transaction_records = TransactionRecord.all
    @transaction_record = TransactionRecord.new
    session[:active_tab] ="PayrollManagement"
    session[:active_tab1] ="complains"
  end

  # GET /transaction_records/1
  # GET /transaction_records/1.json
  def show
  end

  # GET /transaction_records/new
  def new
    @transaction_record = TransactionRecord.new
  end

  # GET /transaction_records/1/edit
  def edit
  end

  # POST /transaction_records
  # POST /transaction_records.json
  def create
    @transaction_record = TransactionRecord.new(transaction_record_params)
    if @transaction_record.save
      #@transaction_record = TransactionRecord.new
      @transaction_records = TransactionRecord.all
      @flag = true
      #TransactionRecordMailer.send_email(@transaction_record).deliver_now
      @transaction_record = TransactionRecord.new
    else
      @flag = false
    end
  end

  
  # PATCH/PUT /transaction_records/1
  # PATCH/PUT /transaction_records/1.json
  def update
    if @transaction_record.update(transaction_record_params)
     @transaction_record = TransactionRecord.new
     @transaction_records = TransactionRecord.all
      @flag = true
    else
      @flag = false
    end
  end

  # DELETE /transaction_records/1
  # DELETE /transaction_records/1.json
  def destroy
    @transaction_record.destroy
    @transaction_records = TransactionRecord.all
    redirect_to transaction_records_path
  end

  def modal_show
    @transaction_record = TransactionRecord.find(params[:format])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction_record
      @transaction_record = TransactionRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_record_params
      params.require(:transaction_record).permit(:compliance_type_id, :transaction_type, :submission_date, :reminder_Date, :previous_days, :after_days, :email_1, :email_2, :email_3, :status, :is_confirm)
    end
end

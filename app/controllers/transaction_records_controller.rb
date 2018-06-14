class TransactionRecordsController < ApplicationController
  before_action :set_transaction_record, only: [:show, :edit, :update, :destroy]

  # GET /transaction_records
  # GET /transaction_records.json
  def index
    @transaction_records = TransactionRecord.all
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

    respond_to do |format|
      if @transaction_record.save
        format.html { redirect_to @transaction_record, notice: 'Transaction record was successfully created.' }
        format.json { render :show, status: :created, location: @transaction_record }
      else
        format.html { render :new }
        format.json { render json: @transaction_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transaction_records/1
  # PATCH/PUT /transaction_records/1.json
  def update
    respond_to do |format|
      if @transaction_record.update(transaction_record_params)
        format.html { redirect_to @transaction_record, notice: 'Transaction record was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction_record }
      else
        format.html { render :edit }
        format.json { render json: @transaction_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction_records/1
  # DELETE /transaction_records/1.json
  def destroy
    @transaction_record.destroy
    respond_to do |format|
      format.html { redirect_to transaction_records_url, notice: 'Transaction record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction_record
      @transaction_record = TransactionRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_record_params
      params.require(:transaction_record).permit(:compliance_type_id, :type, :submission_date, :reminder_Date, :previous_days, :after_days, :email_1, :email_2, :email_3, :status, :is_confirm)
    end
end

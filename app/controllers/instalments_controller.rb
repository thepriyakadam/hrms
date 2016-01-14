class InstalmentsController < ApplicationController
  before_action :set_instalment, only: [:show, :edit, :update, :destroy]

  # GET /instalments
  # GET /instalments.json
  def index
    @instalments = Instalment.all
  end

  # GET /instalments/1
  # GET /instalments/1.json
  def show
    @advance_salary = @instalment.advance_salary
  end

  # GET /instalments/new
  def new
    @instalment = Instalment.new
  end

  # GET /instalments/1/edit
  def edit
  end

  # POST /instalments
  # POST /instalments.json
  def create
    @instalment = Instalment.new(instalment_params)

    respond_to do |format|
      if @instalment.save
        format.html { redirect_to @instalment, notice: 'Instalment was successfully created.' }
        format.json { render :show, status: :created, location: @instalment }
      else
        format.html { render :new }
        format.json { render json: @instalment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instalments/1
  # PATCH/PUT /instalments/1.json
  def update
    @advance_salary = @instalment.advance_salary
    respond_to do |format|
      if @instalment.update(instalment_params)
        format.html { redirect_to @advance_salary, notice: 'Instalment was successfully updated.' }
        format.json { render :show, status: :ok, location: @instalment }
      else
        format.html { render :edit }
        format.json { render json: @instalment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instalments/1
  # DELETE /instalments/1.json
  def destroy
    @instalment.destroy
    respond_to do |format|
      format.html { redirect_to instalments_url, notice: 'Instalment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instalment
      @instalment = Instalment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instalment_params
      params.require(:instalment).permit(:advance_salary_id, :instalment_date, :instalment_amount)
    end
end

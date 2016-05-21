class TrainingTopicMastersController < ApplicationController
  before_action :set_training_topic_master, only: [:show, :edit, :update, :destroy]

  # GET /training_topic_masters
  # GET /training_topic_masters.json
  def index
    @training_topic_masters = TrainingTopicMaster.all
  end

  # GET /training_topic_masters/1
  # GET /training_topic_masters/1.json
  def show
  end

  # GET /training_topic_masters/new
  def new
    @training_topic_master = TrainingTopicMaster.new
  end

  # GET /training_topic_masters/1/edit
  def edit
  end

  # POST /training_topic_masters
  # POST /training_topic_masters.json
  def create
    @training_topic_master = TrainingTopicMaster.new(training_topic_master_params)

    respond_to do |format|
      if @training_topic_master.save
        format.html { redirect_to @training_topic_master, notice: 'Training topic master was successfully created.' }
        format.json { render :show, status: :created, location: @training_topic_master }
      else
        format.html { render :new }
        format.json { render json: @training_topic_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /training_topic_masters/1
  # PATCH/PUT /training_topic_masters/1.json
  def update
    respond_to do |format|
      if @training_topic_master.update(training_topic_master_params)
        format.html { redirect_to @training_topic_master, notice: 'Training topic master was successfully updated.' }
        format.json { render :show, status: :ok, location: @training_topic_master }
      else
        format.html { render :edit }
        format.json { render json: @training_topic_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /training_topic_masters/1
  # DELETE /training_topic_masters/1.json
  def destroy
    @training_topic_master.destroy
    respond_to do |format|
      format.html { redirect_to training_topic_masters_url, notice: 'Training topic master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training_topic_master
      @training_topic_master = TrainingTopicMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def training_topic_master_params
      params.require(:training_topic_master).permit(:code, :name, :description, :status)
    end
end

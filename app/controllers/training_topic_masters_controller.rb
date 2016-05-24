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
    @training_topic_masters = TrainingTopicMaster.all
  end

  # GET /training_topic_masters/1/edit
  def edit
  end

  # POST /training_topic_masters
  # POST /training_topic_masters.json
  def create
    @training_topic_master = TrainingTopicMaster.new(training_topic_master_params)
    @training_topic_masters = TrainingTopicMaster.all
    respond_to do |format|
      if @training_topic_master.save
         @training_topic_master = TrainingTopicMaster.new
        format.js { @flag = true }
      else
        flash.now[:alert] = 'Training Already Exist.'
        format.js { @flag = false }
      end
    end
  end

  # PATCH/PUT /training_topic_masters/1
  # PATCH/PUT /training_topic_masters/1.json
  def update
    @training_topic_master.update(training_topic_master_params)
    @training_topic_masters = TrainingTopicMaster.all
    @training_topic_master = TrainingTopicMaster.new
  end

  # DELETE /training_topic_masters/1
  # DELETE /training_topic_masters/1.json
  def destroy
    @training_topic_master.destroy
   @training_topic_masters = TrainingTopicMaster.all
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
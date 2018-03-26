class TrainingTopicsController < ApplicationController
  before_action :set_training_topic, only: [:show, :edit, :update, :destroy]

  # GET /training_topics
  # GET /training_topics.json
  def index
    @training_topics = TrainingTopic.all
  end

  # GET /training_topics/1
  # GET /training_topics/1.json
  def show
  end

  # GET /training_topics/new
  def new
    @training_topic = TrainingTopic.new
  end

  # GET /training_topics/1/edit
  def edit
  end

  # POST /training_topics
  # POST /training_topics.json
  def create
    @training_topic = TrainingTopic.new(training_topic_params)

    respond_to do |format|
      if @training_topic.save
        format.html { redirect_to @training_topic, notice: 'Training topic was successfully created.' }
        format.json { render :show, status: :created, location: @training_topic }
      else
        format.html { render :new }
        format.json { render json: @training_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /training_topics/1
  # PATCH/PUT /training_topics/1.json
  def update
    respond_to do |format|
      if @training_topic.update(training_topic_params)
        format.html { redirect_to @training_topic, notice: 'Training topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @training_topic }
      else
        format.html { render :edit }
        format.json { render json: @training_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /training_topics/1
  # DELETE /training_topics/1.json
  def destroy
    @training_topic.destroy
    respond_to do |format|
      format.html { redirect_to training_topics_url, notice: 'Training topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training_topic
      @training_topic = TrainingTopic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def training_topic_params
      params.require(:training_topic).permit(:code, :name, :description, :status)
    end
end

class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  # GET /topics
  # GET /topics.json
  def index
    # @topics = Topic.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 1)
    @topics = Topic.where(employee_id: current_user.employee_id).order("id DESC").paginate(:page => params[:page], :per_page => 1)
    # User.paginate(:page => params[:page], :per_page => 1)
    @topic = Topic.new
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
  end

  # GET /topics/new
  def new
    @topic = Topic.new
    session[:active_tab] = "EmployeeSelfService"
  end

  # GET /topics/1/edit
  def edit
  end

  def topic_discussion
    @topics = Topic.where(status: true).order("id DESC").paginate(:page => params[:page], :per_page => 2)
    @topic = Topic.new
  end

  def topic_comm_update
    @comment = TopicComment.find(params[:format])
  end
  
  def update_comment
    comment_id = params[:comment][:comment_id]
    comment = params[:comment][:comment]
    @update_comm = TopicComment.find(comment_id)
    @update_comm.update(comment: comment)
    redirect_to topic_discussion_topics_path
  end

  def inactive_comment
    comment_id = params[:format]
    @update_comm = TopicComment.find(comment_id)
    @update_comm.update(status: false)
    redirect_to topic_discussion_topics_path
  end

  def like_topic
    emp_id = params[:lick_topic][:employee_id]
    topic_id = params[:lick_topic][:topic_id]
    @like = Like.where(employee_id: emp_id,topic_id: topic_id)
    if @like.present?
      @like.destroy_all
    else
      @like = Like.create(employee_id: emp_id, topic_id: topic_id, liked: true)
    end
    redirect_to topic_discussion_topics_path
  end

  def like_comment
    emp_id = params[:lick_topic][:employee_id]
    topic_comment_id = params[:lick_topic][:topic_comment_id]
    @like = Like.where(employee_id: emp_id,topic_comment_id: topic_comment_id)
    if @like.present?
      @like.destroy_all
    else
      @like = Like.create(employee_id: emp_id, topic_comment_id: topic_comment_id, liked: true)
    end
    redirect_to topic_discussion_topics_path
  end

  def add_comment
    employee_id = params[:topic_comment][:employee_id]
    topic_id = params[:topic_comment][:topic_id]
    comment = params[:topic_comment][:comment]
    @topic_comment = TopicComment.create(employee_id: employee_id, topic_id: topic_id, comment: comment, status: true)
    # respond_to do |format|
    #   if @topic_comment.save
    #     #@topic_comment = TopicComment.new(employee_id: employee_id, topic_id: topic_id, comment: comment, status: true)
    #     @topics = Topic.all.order("id DESC")
    #     # @topic = Topic.new
    #     # @topic = Topic.new
    #     format.js { @flag = true }
    #   else
    #     format.js { @flag = false }
    #   end
    # end
    redirect_to topic_discussion_topics_path
  end

  def all_comment
    topic_id = params[:format]
    @topics = Topic.where(id: topic_id)
    @comment_list = TopicComment.where(topic_id: topic_id,status: true)
  end

  def topic_wise_comment
  end

  def view_topic_details
    if params[:format] == "pdf" || params[:format] == "xls"
      @topics = Topic.where(id: params[:topic_id])
      @comment_list = TopicComment.where(topic_id: params[:topic_id])
      respond_to do |f|
        f.js
        f.xls {render template: 'topics/topic_details.xls.erb'}
        f.html
        f.pdf do
          render pdf: 'topic_details',
          layout: 'pdf.html',
          orientation: 'Landscape',
          template: 'topics/topic_details.pdf.erb',
          show_as_html: params[:debug].present?
          #margin:  { top:1,bottom:1,left:1,right:1 }
        end
      end
    else
      topic_id = params[:format]
      @topics = Topic.find(topic_id)
    end
  end

  def topic_list
    @topics = Topic.where(employee_id: current_user.employee_id)
  end

  def all_topic_list
    @topics = Topic.where(status: true)
  end

  def all_topic_details
    topic_id = params[:format]
    @topics = Topic.where(id: topic_id)
    @comment_list = TopicComment.where(topic_id: topic_id)
  end

  def inactive_topic
    topic_id = params[:format]
    @topic = Topic.find(topic_id)
    @topic.update(status: false)
    redirect_to all_topic_list_topics_path
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      @topics = Topic.all
      @topic = Topic.new
      @flag = true
    else
      @flag = false
    end
    redirect_to topics_path
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    if @topic.update(topic_params)
      @topics = Topic.all
      @topic = Topic.new
      @flag = true
    else
      @flag = false
    end
    redirect_to topics_path
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:avatar, :employee_id, :post_topic, :description, :status)
    end
end

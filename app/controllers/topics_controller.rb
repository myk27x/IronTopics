class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topic = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def show
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    @topic.save

    redirect_to topics_path
  end

private
  def topic_params
    params.require(:topic).permit(:title, :description)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

end

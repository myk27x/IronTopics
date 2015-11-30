class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :edit, :update]

  def index
    @topic = Topic.all.order(score: :desc)
  end

  def new
    @topic = Topic.new
  end

  def search
    found = params[:title]
    @topic = Topic.where("title like ?", "%#{found}%")
  end

  def show
    @commented = current_user.interests.where("topic_id = ?", @topic.id)
    @rated = @commented.where("rating is not null")
    @interest = Interest.new
    @user = User.find_by(current_user.id)
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    @topic.save

    redirect_to topics_path
  end

  def update
    @topic.update(topic_params)

    redirect_to topics_path
  end

private
  def topic_params
    params.require(:topic).permit(:title, :description, :focus)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to topics_path, notice: "ERROR::FILE NOT FOUND"
  end

end

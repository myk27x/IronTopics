class TopicsController < ActionController::Base
  before_action :authenticate_user!

  def index
    @topic = Topic.all.each do |topic|
      topic
    end
  end

  def new
    @topic = Topic.new
  end

  def create
    topic = Topic.create(topic_params)

    redirect_to topics_path
  end

private
  def topic_params
    params.require(:topic).permit(:title, :description)
  end

end

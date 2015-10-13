class InterestsController < ApplicationController
  before_action :authenticate_user!

  def create
    @interest = Interest.new(interest_params)
    @interest.user_id = current_user.id
    @interest.topic_id = (params[:topic_id])

    @topic = Topic.find_by('id = ?', @interest.topic_id)
    unless @interest.rating == nil
      @topic.score += @interest.rating
    end
    @topic.comment_count += 1

    @interest.save
    @topic.save

    redirect_to topic_path(@interest.topic_id)
  end

private
  def interest_params
    params.require(:interest).permit(:rating, :comment, :topic_id)
  end
end

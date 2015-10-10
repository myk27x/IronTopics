class InterestsController < ApplicationController

  def create
    @interest = Interest.new(interest_params)
    @interest.user_id = current_user.id
    @interest.topic_id = current_topic.id
    @interest.save

    redirect_to topics_path
  end

private
  def interest_params
    params.require(:interest).permit(:rating, :comment)
  end
end

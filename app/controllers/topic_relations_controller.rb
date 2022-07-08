class TopicRelationsController < ApplicationController
  #  before_action :authenticate_user!

  def create
    @topic = Topic.find(params[:topic_added_id])
    current_user.followt(@topic)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @topic = TopicRelation.find(params[:id]).topic_added
    current_user.unfollowt(@topic)
    respond_to do |format|
      format.html
      format.js
    end
  end
end

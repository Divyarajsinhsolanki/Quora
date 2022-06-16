class TopicRelationsController < ApplicationController
#  before_action :authenticate_user!

  def create

  # return  render body: params.inspect

    @topic = Topic.find(params[:topic_added_id])
    current_user.followt(@topic)
    respond_to do |format|
      format.html { redirect_to  }
      format.js
    end
  end



  def destroy

    @topic = TopicRelation.find(params[:id]).topic_added 
    current_user.unfollowt(@topic)
    respond_to do |format|
      format.html { redirect_to  }
      format.js
    end
  end

end

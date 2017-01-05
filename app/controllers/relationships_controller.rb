class RelationshipsController < ApplicationController
  layout 'show.application'
def index
end

def create
    user = User.find(params[:following_id])
    current_user.follow(user)
    redirect_to user
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user
  end
end

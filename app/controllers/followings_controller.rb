class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @follow = Following.new(followed_id: params[:followed_id], follower_id: params[:follower_id])

    if @follow.save
      redirect_back(fallback_location: root_path, notice: 'You follow this user.')
    else
      redirect_back(fallback_location: root_path, notice: 'You cannot follow this user.')
    end
  end

  def destroy
    follow = Following.find_by(id: params[:id], follower_id: current_user, followed_id: params[:followed_id])
    if follow
      follow.destroy
      redirect_back(fallback_location: root_path, notice: 'You unfollow this user.')
    else
      redirect_back(fallback_location: root_path, alert: 'You cannot unfollow this user that you are not following.')
    end
  end
end

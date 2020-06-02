class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = current_user.likes.new(gambit_id: params[:gambit_id])

    if @like.save
      redirect_back(fallback_location: root_path, notice: 'You liked a gambit.')
    else
      redirect_back(fallback_location: root_path, notice: 'You cannot like this gambit.')
    end
  end

  def destroy
    like = Like.find_by(id: params[:id], user: current_user, gambit_id: params[:gambit_id])
    if like
      like.destroy
      redirect_back(fallback_location: root_path, notice: 'You disliked a gambit.')
    else
      redirect_back(fallback_location: root_path, alert: 'You cannot dislike gambit that you did not like before.')
    end
  end

end

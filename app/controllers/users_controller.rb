class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.order(created_at: :desc).paginate(page: params[:page], per_page: 20)
  end

  def show
    @user = User.find(params[:id])
    @gambits = @user.gambits.ordered_by_most_recent
    @followers = @user.random if @user.followers.any?
  end
end

class UsersController < ApplicationController
  # rubocop:disable  Style/GuardClause
  before_action :authenticate_user!

  def index
    @users = User.all.order(created_at: :desc).paginate(page: params[:page], per_page: 20)
  end

  def show
    @user = User.find(params[:id])
    @gambits = @user.gambits.ordered_by_most_recent
    if @user.followers.any?
      @followers = @user.random
    end
  end
end
# rubocop:enable  Style/GuardClause

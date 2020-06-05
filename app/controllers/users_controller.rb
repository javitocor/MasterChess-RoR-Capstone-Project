class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @gambits = @user.gambits.ordered_by_most_recent
    if @user.followers.any?
      @fol1 = @user.random
      @fol2 = @user.random
      @fol3 = @user.random
    end
  end

end

class GambitsController < ApplicationController
  before_action :set_gambit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /gambits
  # GET /gambits.json
  def index
    @gambit = Gambit.new
    @user = User.all    
    timeline_gambit
  end

  # GET /gambits/1
  # GET /gambits/1.json
  def show
  end

  # GET /gambits/new
  def new
    @gambit = Gambit.new
  end

  # GET /gambits/1/edit
  def edit
  end

  # POST /gambits
  # POST /gambits.json
  def create
    @gambit = current_user.gambits.new(gambit_params)

    if @gambit.save
      redirect_to root_path, notice: 'Gambit was successfully created.'
    else
      timeline_posts
      render :index, alert: 'Gambit was not created.'
    end
  end


  # PATCH/PUT /gambits/1
  # PATCH/PUT /gambits/1.json
  def update
    respond_to do |format|
      if @gambit.update(gambit_params)
        format.html { redirect_to @gambit, notice: 'Gambit was successfully updated.' }
        format.json { render :show, status: :ok, location: @gambit }
      else
        format.html { render :edit }
        format.json { render json: @gambit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gambits/1
  # DELETE /gambits/1.json
  def destroy
    @gambit.destroy
    respond_to do |format|
      format.html { redirect_to gambits_url, notice: 'Gambit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gambit
      @gambit = Gambit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gambit_params
      params.require(:gambit).permit(:text)
    end

    def timeline_gambit 
      @timeline_gambits = Gambit.all.ordered_by_most_recent.includes(:user).select do |gambit|
        gambit.user_id == friends_gambits(gambit.user_id)
      end
    end

    def friends_gambits(user)
      user if Following.where(follower_id: current_user.id, followed_id: user).exists? || user == current_user.id
    end
end
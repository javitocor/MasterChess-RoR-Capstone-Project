class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.gambit_id = params[:gambit_id]
    @comment.user = current_user

    if @comment.save
      redirect_back(fallback_location: root_path, notice: 'Comment was successfully created.')
    else
      redirect_back(fallback_location: root_path, alert: @comment.errors.full_messages.join('. ').to_s)
    end
  end

  def destroy
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_back(fallback_location: root_path, notice: 'Comment was successfully destroyed.') }
      else
        redirect_back(fallback_location: root_path, alert: @comment.errors.full_messages.join('. ').to_s)
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:content)
  end
end

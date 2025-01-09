class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to prototype_path(@prototype)
    else
      @comments = @prototype.comments
       Rails.logger.debug "Prototype save errors: #{@prototype.errors.full_messages}"
      render "prototypes/show", status: :unprocessable_entity
    end
  end
  def create_comment
    @comment = Comment.new(comment_params)
  end

  

  private

  def comment_params
    params.require(:comment).permit(:content, :prototype_id, :user_id).merge(user_id: current_user.id)
  end
end


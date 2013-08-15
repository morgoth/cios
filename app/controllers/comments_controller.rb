class CommentsController < ApplicationController
  before_filter :authenticate_user!, :only => [:destroy, :edit, :update, :mark_as_spam]

  def edit
    comment
  end

  def create
    @comment = post.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        if @comment.approved?
          flash.now[:notice] = t("comment_created")
        else
          flash.now[:error] = t("spam_comment")
        end
        format.html { redirect_to post }
        format.js
      else
        format.html { redirect_to post }
        format.js
      end
    end
  end

  def update
    if comment.update_attributes(comment_params)
      redirect_to post, :notice => t("comment_updated")
    else
      render :edit
    end
  end

  def mark_as_spam
    comment.mark_as_spam!
    redirect_to post, :notice => t("comment_marked_as_spam")
  end

  def destroy
    comment.destroy
    redirect_to post, :notice => t("comment_destroyed")
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :content)
  end

  def post
    @post ||= Post.find(params[:post_id])
  end

  def comment
    @comment ||= post.comments.find(params[:id])
  end
end

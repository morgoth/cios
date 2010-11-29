class CommentsController < ApplicationController
  before_filter :login_required, :only => [:destroy, :edit, :update, :mark_as_spam]

  def edit
    comment
  end

  def create
    @comment = Comment.new(params[:comment])
    respond_to do |format|
      if @comment.save
        if @comment.approved?
          @status = 'saved'
          flash[:notice] = t("comment_created")
        else
          @status = 'spam'
          flash[:error] = t("spam_comment")
        end
        format.html { redirect_to @comment.post }
        format.js
      else
        @status = 'not_saved'
        format.html {  redirect_to @comment.post }
        format.js
      end
    end
  end

  def update
    if comment.update_attributes(params[:comment])
      redirect_to comment.post, :notice => t("comment_updated")
    else
      render :edit
    end
  end

  def mark_as_spam
    comment.mark_as_spam!
    redirect_to comment.post, :notice => t("comment_marked_as_spam")
  end

  def destroy
    comment.destroy
    redirect_to @comment.post, :notice => t("comment_destroyed")
  end

  private

  def comment
    @comment ||= Comment.find(params[:id])
  end
end

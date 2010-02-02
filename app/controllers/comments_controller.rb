class CommentsController < ApplicationController
  before_filter :login_required, :only => [:destroy, :edit, :update]

  def edit
    @comment = Comment.find(params[:id])
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
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = t("comment_updated")
      redirect_to @comment.post
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = t("comment_destroyed")
    redirect_to @comment.post
  end
end

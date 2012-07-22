class SpamReportsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @comments = Comment.not_approved.all(:include => :defensio_report)
  end

  def update
    @comment = DefensioReport.find(params[:id]).comment
    if params[:defensio_report][:allow]
      @comment.approve!
    else
      @comment.mark_as_spam!
    end
    redirect_to spam_reports_path, :notice => "Comment updated"
  end

  def update_multiple
    params[:comment_ids] ||= []
    @comments = Comment.find(params[:comment_ids])
    if params[:approve_comments]
      @comments.each { |c| c.approve! }
      flash[:notice] = "Comments approved"
    elsif params[:destroy_comments]
      @comments.each { |c| c.destroy }
      flash[:notice] = "Comments destroyed"
    end
    redirect_to spam_reports_path
  end
end

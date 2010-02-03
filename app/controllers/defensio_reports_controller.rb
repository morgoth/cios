class DefensioReportsController < ApplicationController
  before_filter :login_required

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
    flash[:notice] = "Comment updated"
    redirect_to defensio_reports_path
  end

  def destroy_multiple
    params[:comment_ids] ||= []
    @comments = Comment.find(params[:comment_ids])
    @comments.each { |c| c.destroy }
    flash[:notice] = "Comments destroyed"
    redirect_to defensio_reports_path
  end
end
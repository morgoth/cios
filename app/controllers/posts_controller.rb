class PostsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]

  def index
    @posts = Post.paginate :page => params[:page], :per_page => 5
    respond_to do |format|
      format.html
      format.rss
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = @current_user.posts.build
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = @current_user.posts.build(params[:post])
    if @post.save
      redirect_to @post, :notice => t("post_created")
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to @post, :notice => t("post_updated")
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, :notice => t("post_destroyed")
  end
end

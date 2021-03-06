class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

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
    @post = current_user.posts.build
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, :notice => t("post_created")
    else
      render :new
    end
  end

  def update
    @post = Post.find(post_params)
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

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end

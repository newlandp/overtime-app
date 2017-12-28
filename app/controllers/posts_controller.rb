class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :approve]

  def index
    @posts = Post.posts_by(current_user).page(params[:page]).per(5)
  end

  # REFACTOR
  def index_json
    @posts = Post.posts_by(current_user).page(params[:page]).per(5)
    render json: @posts
  end

  def show
    @user = @post.user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    
    if @post.save
      redirect_to post_path(@post.id), notice: "Post created successfully"
    else
      render :new
    end
  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    
    if @post.update(post_params)
      redirect_to post_path(@post.id), notice: "Post updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @post.delete
    redirect_to posts_path
  end

  def approve
    authorize @post
    @post.approved!
    redirect_to root_path, notice: "The post has been approved"
  end

private

  def post_params
    params.require(:post).permit(:overtime_request, :date, :rationale, :status)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end

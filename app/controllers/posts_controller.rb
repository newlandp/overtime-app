class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :update_json, :destroy, :approve]
  skip_before_action :verify_authenticity_token, only: [:destroy, :update_json]

  def index
    @posts = Post.posts_by(current_user).page(params[:page]).per(5)
  end

  # TODO: REFACTOR
  def index_json
    total_count = current_user.posts.count
    @posts = current_user.posts.limit(params[:limit]).offset(params[:offset])
    posts = @posts.as_json(include: :user)
    render json: { posts: posts, total_count: total_count }
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

  def update_json
    authorize @post
    if @post.update(post_params)
      post = @post.as_json(include: :user)
      render json: post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.delete
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

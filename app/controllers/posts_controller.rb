class PostsController < ApplicationController

  def index
    @posts = Post.where(user_id: params[:user_id])
    render json: @posts, each_serializer: PostSerializer, status: :ok
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post, serializer: PostSerializer, status: :created
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update 
    @post = current_user.posts.find(params[:post_id])
    if @post.update(post_params)
      @post.reload
      render json: @post, serializer: PostSerializer, status: :updated
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @post = current_user.posts.find(params[:post_id])
    if @post.destroy
      head :no_content
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def post_params
    params.permit(:text, :scheduled_date)
  end
end

class Api::V1::PostsController < ApplicationController
  
  def index
    posts = Posts.all
    render json: {posts: posts}, status: :200
  end

  def show
    post = Posts.find_by(params[:id])
    if post
      render json: {post: post}, status: :200
    else
      render json: {error: "No post found with that id"}
    end
  end

  def create
    posts = Posts.new(
      title: post_params[:title],
      body: post_params[:body],
      author: post_params[:author]
    )
    if posts.save
      render json: { message: 'post created' }, status: :200
    else
      render json: { error: "Something Wrong Happened!"}
    end
  end

  def update
    post = Posts.find_by(params[:id])
    if post
      post.update(
        title: post_params[:title],
        body: post_params[:body],
        author: post_params[:author]
        )
      render json: {message: 'post updated successfully'}, status: :200
    else
      render json: {error: "No post found with that ID"}, status: :404
    end
  end

  def destroy
    post = Posts.find_by(params[:id])
    if post
      post.destroy
      render json: {message: 'post deleted'}
    else
      render json: {error: "No post found with that ID"}, status: :404
    end
  end

  private
  def post_params
    params.require(:post).permit([:title, :body, :author])
  end

end

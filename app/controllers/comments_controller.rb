class CommentsController < ApplicationController
  before_action :get_post_id

  def index
    redirect_to posts_path
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.save
    redirect_to post_path(@post)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end


  private

  def get_post_id
    @post = Post.find(params[:post_id])
  end


  def comment_params
    params.require(:comment).permit(:body)
  end

end

class CommentsController < ApplicationController
  before_action :get_post_id

  # do you need all 7 actions for comments?
  def index
    redirect_to posts_path
  end

  def new
    @comment = Comment.new
  end

  def create

    @comment = @post.comments.create!(comment_params.merge({user_id: session[:user]["id"]}))
    # there's nothing wrong with your approach to associating users and comments
    # but here's another way I think think may be more readable:

    # @user = User.find(session[:user][:id]])
    # @user.comments.create!(comment_params)

    # if we have a method `current_user`, we can eliminate the first line and just
    # do the following:
    # current_user.comments.create!(comment_params)


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

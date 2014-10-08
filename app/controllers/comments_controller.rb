class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:author, :body))

    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  def destroy_multiple
    @post = Post.find(params[:post_id])
    @comments = @post.comments.find(params[:comments])
    @comments.each{ |c| c.destroy }
    redirect_to post_path(@post)
  end

end

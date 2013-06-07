class PostsController < ApplicationController
  def create
  	@post = Blog.find(params[:blog_id]).posts.new(params[:post])
    @post.user_id = current_user.id

    if @post.save
      flash[:success] = "Post has been added!"
    elsif 
      flash[:error] = @post.errors.full_messages
    end

    redirect_to blog_path(@post.blog_id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to blog_path(params[:blog_id])
  end
end

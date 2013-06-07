class BlogsController < ApplicationController
  def index
  	if current_user
  		@blogs = Blog.order('id DESC').all
   	 	@blog = Blog.new
  	elsif 
  		redirect_to '/signin'		
  	end
  end

  def create
  	@blog = Blog.new(params[:blog])
  	
    if @blog.save
      	flash[:success] = "#{@blog.title} is now added!"
  		@owner = Owner.new(:user_id => current_user.id, :blog_id => @blog.id).save
    elsif 
     	flash[:error] = @blog.errors.full_messages
    end

    redirect_to blogs_path
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    redirect_to blogs_path
  end
end

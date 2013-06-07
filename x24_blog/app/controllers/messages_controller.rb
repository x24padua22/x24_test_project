class MessagesController < ApplicationController
  def create
  	@message = Post.find(params[:post_id]).messages.new(params[:message])
    @message.user_id = current_user.id

    if @message.save
      flash[:success] = "Message has been added!"
    elsif 
      flash[:error] = @message.errors.full_messages
    end

    redirect_to blog_path(params[:blog_id])
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    redirect_to blog_path(params[:blog_id])
  end
end

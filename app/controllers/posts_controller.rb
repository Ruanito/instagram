class PostsController < ApplicationController
  def create
    params = post_params.to_h
    params[:user_id] = session[:user_id]
    @post = Post.new(params)

    if @post.save
      redirect_to users_url
    else
      flash[:notice] = @post.errors.full_messages[0]
      redirect_to users_url
    end
  end

  private
    def post_params
      params.require(:post).permit(:message, :image)
    end
end

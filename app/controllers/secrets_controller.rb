class SecretsController < ApplicationController
  def index
    @user = User.find_by_id(session[:user_id])
  	@secrets = Secret.all.includes(:likes, :user)
    @like = Like.find_by(user_id: @user.id)
    end
  def delete
  	Secret.find(params[:id]).destroy
  	redirect_to '/users'
  end
  def create
  	@secret = Secret.create(secret_params)
  	redirect_to '/secrets'
  end
  def like
  	Like.create(likes_params)
    redirect_to '/secrets'
  end
  def unlike
    Like.find_by(likes_params).destroy
    redirect_to '/secrets'
  end

  private
  
  def secret_params
  	params.require(:secrets).permit(:id, :content, :user_id)
  end
  def likes_params
  	params.require(:likes).permit(:id, :secret_id, :user_id)
  end
end
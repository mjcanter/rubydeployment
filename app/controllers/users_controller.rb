class UsersController < ApplicationController
	before_action :check_session
  def index
    @user = User.find_by_id(session[:user_id])
    @secrets = Secret.all.includes(:likes)
    @like = Like.find_by(user_id: @user.id)

  end
  def delete
  	User.find(params[:id]).destroy
  	redirect_to '/sessions'
  end
  def edit
  	user = User.update(user_params)

  	if User.valid?
  		redirect_to '/users'
  	else
  		redirect_to '/edit'
  		flash[:error] = @message.errors
    end
  end  
  def like
    Like.create(likes_params)
    redirect_to '/users'
  end
  def unlike
    Like.find_by(likes_params).destroy
    redirect_to '/users'
  end
  private
  def likes_params
    params.require(:likes).permit(:id, :secret_id, :user_id)
  end
  def check_session
  	if !session[:user_id]
  		redirect_to '/'
    end
  end
  def user_params
  	params.require(:user).permit(:name,:email, :password, :password_confirmation)
  end
end

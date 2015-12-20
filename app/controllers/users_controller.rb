class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def created
    @user = User.new(user_params)
    @article.user = User.last
    if @user.save
      flash[:success] = "Welcome to the Happy Blog #{@user.username}"
      redirect_to_article_path
    else
      render 'new'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
end

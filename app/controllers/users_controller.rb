class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post_reviews = PostReview.where(user_id: @user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  def destroy
    Game.find_by(id: params[:id]).destroy
    redirect_to games_path
  end
  
  def search
    @searched_users = Post.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end

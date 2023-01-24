class GamesController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @game = Game.find(params[:id])
    @post_review = PostReview.new
    @post_reviews = @game.post_reviews.all
  end
  
  def create
    @game = Game.new(game_params)
    @game.user_id = current_user.id
    if @game.save
      flash[:notice] = 'You have created game successfully.'
      redirect_to game_path(@game.id)
    else
      @user = User.find(current_user.id)
      @games = Game.all
      render :index
    end
  end

  def index
    @game = Game.new
    @user = User.find(current_user.id)
    @games = Game.all
  end
  
  def destroy
    Game.find_by(id: params[:id]).destroy
    redirect_to games_path
  end
  
  def edit
    @game = Game.find(params[:id])
  end
  
  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      flash[:notice] = 'You have updated game successfully.'
      redirect_to game_path(@game.id)
    else
      render :edit
    end
  end
  
  private
  
  def game_params
    params.require(:game).permit(:game_title, :about, :game_image, :user_id)
  end
end

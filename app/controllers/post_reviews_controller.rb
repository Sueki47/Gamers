class PostReviewsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @post_review = current_user.post_reviews.new(post_review_params)
    @post_review.game_id = @game.id
    if @post_review.save
      flash[:notice] = 'You have posted review successfully.'
      redirect_to game_post_review_path(@post_review.game.id, @post_review.id)
    else
      @game = Game.find(params[:game_id])
      render :show
    end
  end

  def destroy
    PostReview.find_by(id: params[:id]).destroy
    redirect_to user_path(params[:game_id])
  end

  def show
    @post_review = PostReview.find(params[:id])
  end

  def edit
    @post_review = PostReview.find(params[:id])
    @game = Game.find(params[:game_id])
  end

  def update
    @post_review = PostReview.find(params[:id])
    if @post_review.update(post_review_params)
      flash[:notice] = 'You have updated book successfully.'
      redirect_to game_post_review_path(@post_review.id)
    else
      render :edit
    end
  end

  private

  def post_review_params
    params.require(:post_review).permit(:review_title, :opinion, :review_image, :user_id, :game_id)
  end
end

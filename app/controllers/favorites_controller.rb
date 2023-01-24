class FavoritesController < ApplicationController
  def create
    post_review = PostReview.find(params[:post_review_id])
    favorite = current_user.favorites.new(post_review_id: post_review.id)
    favorite.save
    redirect_to game_post_review_path(post_review.game_id, post_review.id)
  end

  def destroy
    post_review = PostReview.find(params[:post_review_id])
    favorite = current_user.favorites.find_by(post_review_id: post_review.id)
    favorite.destroy
    redirect_to game_post_review_path(post_review.game_id, post_review.id)
  end
end

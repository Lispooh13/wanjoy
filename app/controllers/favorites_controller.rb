class FavoritesController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!

  def create
    if @post.user_id != current_user.id   # 投稿者本人はいいね不可
       @favorite = Favorite.create(user_id: current_user.id, post_id: @post.id)
    end

    #@post = Post.find(params[:post_id])
  end


  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
    @favorite.destroy
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end

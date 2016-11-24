class FavoritesController < ApplicationController

  def new
  	@favorite = current_user.favorites.build
  end

  def create

  	@favorite = current_user.favorites.build(favorite_params)

    if @favorite.save
      redirect_to @favorite, notice: 'Favorite was successfully created.' 
    else
      render :new
    end

  end

  def remove
  end
end

class FavoritesController < ApplicationController
  def add
  end

  def new
  	@favorite = current_user.favorites.build
  end

  def create

  	@favorite = current_user.favorites.build(favorite_params)

    if @favorite.save
      redirect_to @favorite, notice: 'Pin was successfully created.' 
    else
      render :new
    end

  end

  def remove
  end
end

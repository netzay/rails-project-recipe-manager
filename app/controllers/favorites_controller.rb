class FavoritesController < ApplicationController

  def favorite
    if logged_in? 
      recipe = Recipe.find_by(id: params[:recipe_id])
      favorite = Favorite.new(recipe: recipe, user: current_user)
      if favorite.save 
        flash["notice"] = "You have favorited #{recipe.name}"
      else 
        flash["alert"] = "Something has gone wrong"
      end
    else 
      flash["alert"] = "Please login to favorite recipes"
    end
    redirect_back(fallback_location: root_path)
  end

  def unfavorite
    if logged_in? 
      recipe = Recipe.find_by(id: params[:recipe_id])
      favorite = Favorite.find_by(recipe: recipe, user: current_user)
      favorite.delete
      flash["notice"] = "You have unfavorited #{recipe.name}"
    else 
      flash["alert"] = "Please login to favorite recipes"
    end
    redirect_back(fallback_location: root_path)
  end
end
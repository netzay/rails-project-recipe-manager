class FavoritesController < ApplicationController

  # def show
  #   favorite = Favorite.find_by(recipe: find_by_recipe_id, user: current_user)
  #   respond_to do |format|
  #     format.json { render json: favorite }
  #   end
  # end

  def favorite
    if logged_in? 
      recipe = find_by_recipe_id
      favorite = Favorite.new(recipe: recipe, user: current_user)
      if favorite.save 
        flash["notice"] = "You have favorited #{recipe.name}"
      else 
        flash["alert"] = "Something has gone wrong"
      end
    else 
      flash["alert"] = "Please login to favorite recipes"
    end
    respond_to do |format|
      format.json { render json: favorite }
    end
  end

  def unfavorite
    if logged_in? 
      recipe = find_by_recipe_id
      favorite = Favorite.find_by(recipe: recipe, user: current_user)
      favorite.delete
      flash["notice"] = "You have unfavorited #{recipe.name}"
    else 
      flash["alert"] = "Please login to favorite recipes"
    end
    respond_to do |format|
      format.json { render json: favorite }
    end
  end
end

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  def self.top_favorited(number)
    group('recipe_id').order('COUNT(*) DESC').select('recipe_id').limit(number)
  end
end

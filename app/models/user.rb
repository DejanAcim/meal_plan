class User < ApplicationRecord
  include Clearance::User

  has_many :recipes

  def recipe_options
    recipes.map do |recipe|
      [recipe.name, recipe.id]
    end
  end
end

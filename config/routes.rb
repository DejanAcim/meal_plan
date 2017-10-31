Rails.application.routes.draw do
  root to: "welcome#show"

  resources :recipes
  resources :meal_plans
end

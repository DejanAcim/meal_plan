class MealPlansController < ApplicationController
  before_action :require_login

  def new
    @meal_plan = current_user.meal_plans.build(
      start_date: params[:start_date] || Date.today,
      end_date: params[:end_date] || 6.days.from_now.to_date
    )

    @meal_plan.build_meals
  end

  def create
    @meal_plan = current_user.meal_plans.build(meal_plan_params)

    if @meal_plan.save
      redirect_to meal_plan_path(@meal_plan), notice: "Meal plan created!"
    else
      @errors = @meal_plan.errors.full_messages
      render :new
    end
  end

  private

  def meal_plan_params
    params.require(:meal_plan).permit(
      :start_date,
      :end_date,
      meals_attributes: [
        :id,
        :date,
        :recipe_id
      ]
    )
  end
end

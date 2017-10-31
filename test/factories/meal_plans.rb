FactoryGirl.define do
  factory :meal_plan do
    start_date { Date.today }
    end_date { 6.days.from_now }

    association(:user)
  end
end

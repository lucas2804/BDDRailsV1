FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "test#{n}@gmail.com"}
    password "password"

    trait :admin do
      admin true
    end
  end
end

# 1)sequence(:email)
# -> will generate test01@gmail.com, test02/03/04@gmail.com to make Devise validation happy.
# 2) trait :admin
# FactoryGirl.create(:user, :admin) will have "admin" attribute set to true
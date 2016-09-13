FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "test#{n}@gmail.com"}
    password "password"
  end
end

#sequence(:email)
# -> will generate test01@gmail.com, test02/03/04@gmail.com to make Devise validation happy.

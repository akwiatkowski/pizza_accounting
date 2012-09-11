FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "guy_#{n}@email.gov" }
    password 'password'
    password_confirmation 'password'
  end
end
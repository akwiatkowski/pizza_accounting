FactoryGirl.define do
  factory :doctor do
    sequence(:name) { |n| "doctor_" + n.to_s }
    sequence(:phone) { |n| "phone_" + n.to_s }
    sequence(:email) { |n| "email_" + n.to_s + "@manatech.pl" }
  end
end
FactoryGirl.define do
  factory :group do
    sequence(:name) { |n| "group_" + n.to_s }
    association :owner, factory: :user
  end
end
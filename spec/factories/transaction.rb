FactoryGirl.define do
  factory :transaction do
    amount 10.0

    association :creator, factory: :user
    association :payer, factory: :user
    association :group

    direction Transaction::DIRECTIONS[:incoming]
  end
end
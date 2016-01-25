FactoryGirl.define do

  factory :user do
    sequence(:name) { |n| "user#{n}" }
    email { "#{name}@trader.com" }
    # password '12345678'
  end

  factory :challenge do

  end

end

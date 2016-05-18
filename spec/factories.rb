require 'faker'

FactoryGirl.define do

  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end

  factory :event do
    name 'Sample Event'
  end

  factory :challenge do
    association :creator, factory: :user
    association :event, factory: :event
  end

end

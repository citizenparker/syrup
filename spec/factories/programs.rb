# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :program do
    name "Cool Program"
    maximum_participants 15
    minimum_age 5
    maximum_age 10
  end
end

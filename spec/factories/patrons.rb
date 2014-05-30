# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :patron do
    name "Marky Mark"
    age 10
    phone_number "123-456-7800"
    address_street "123 Funky Bunch Ln"
    address_city "Cooltown"
    address_zipcode "90210"
  end
end

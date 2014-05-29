class Patron < ActiveRecord::Base
  validates_presence_of :name, :age, :address_street, :address_city, :address_zipcode
end

require 'spec_helper'

describe Patron do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :phone_number }
    it { should validate_presence_of :address_street }
    it { should validate_presence_of :address_city }
    it { should validate_presence_of :address_zipcode }
  end
end

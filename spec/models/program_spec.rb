require 'spec_helper'

describe Program do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :maximum_participants}
    it { should validate_presence_of :maximum_age }
    it { should validate_presence_of :minimum_age }
  end
end

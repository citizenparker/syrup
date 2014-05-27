require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ProgramsHelper. For example:
#
# describe ProgramsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe ProgramsHelper do
  describe "#program_capacity" do
    it "provides the program capacity when there is one" do
      program = Program.new(:maximum_participants => 25)
      helper.program_capacity(program).should == 25
    end

    it "states 'Unlimited' when there is no capacity" do
      program = Program.new
      helper.program_capacity(program).should == "Unlimited"
    end
  end
end

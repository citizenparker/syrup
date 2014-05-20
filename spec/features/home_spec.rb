require "spec_helper"

describe "Homepage", :type => :feature do
  it "redirects to programs#index" do
    visit "/"
    current_path.should == programs_path
  end
end

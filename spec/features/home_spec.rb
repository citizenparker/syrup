require "spec_helper"

describe "Homepage", :type => :feature do
  it "redirects to programs#index" do
    visit "/"
    current_path.should == programs_path
  end

  it "links to important pages" do
    visit "/"
    click_on("Programs")
    current_path.should == programs_path

    visit "/"
    click_on("Patrons")
    current_path.should == patrons_path
  end
end

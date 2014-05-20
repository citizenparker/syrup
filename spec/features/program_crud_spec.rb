require "spec_helper"

describe "program Create/Read/Update", :type => :feature do
  describe "index" do
    it "lists programs as links to view them" do
      program = FactoryGirl.create(:program, :name => "PenPals", :capacity => 25)

      visit "/programs"
      click_on("PenPals")
      current_path.should == program_path(program)
    end
  end

  describe "show" do
    before(:each) do
      @program = FactoryGirl.create(:program, :name => "PenPals", :capacity => 25)
    end

    it "lists details about the program" do
      visit("/programs/#{@program.id}")

      page.should have_content("PenPals")
      page.should have_content(25)
    end

    it "contains a link to edit the program" do
      visit("/programs/#{@program.id}")

      click_on("Edit")
      current_path.should == edit_program_path(@program)
    end
  end

  describe "edit" do
    it "allows you to edit the program" do
      program = FactoryGirl.create(:program, :name => "PenPals", :capacity => 25, :minimum_age => 10, :maximum_age => 15)
      visit(edit_program_path(program))

      page.should have_field("Name", :with => "PenPals")
      page.should have_field("Capacity", :with => "25")

      fill_in("Capacity", :with => 30)
      fill_in("Name", :with => "PlayPals")
      fill_in("Minimum Age", :with => 18)
      fill_in("Maximum Age", :with => 24)

      click_on("Save")
      current_path.should == program_path(program)

      page.should have_content("PlayPals")
      page.should have_content(30)
      page.should have_content(18)
      page.should have_content(24)
    end
  end
end

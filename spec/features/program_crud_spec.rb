require "spec_helper"

describe "program Create/Read/Update", :type => :feature do
  describe "index" do
    it "lists programs as links to view them" do
      program = FactoryGirl.create(:program, :name => "PenPals", :maximum_participants => 25)

      visit "/programs"
      click_on("PenPals")
      current_path.should == program_path(program)
    end
  end

  describe "show" do
    before(:each) do
      @program = FactoryGirl.create(:program, :name => "PenPals", :maximum_participants => 25)
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

  describe "new/create" do
    it "allows you to create a program" do
      visit(new_program_path)

      fill_in("Maximum Number of Participants", :with => 30)
      fill_in("Name", :with => "PlayPals")
      fill_in("Minimum Age", :with => 18)
      fill_in("Maximum Age", :with => 24)

      click_on("Save")
      program = Program.where(:name => "PlayPals").first
      current_path.should == program_path(program)

      page.should have_content("PlayPals")
      page.should have_content(30)
      page.should have_content(18)
      page.should have_content(24)
    end

    it "shows validation errors" do
      visit(new_program_path)

      fill_in("Maximum Number of Participants", :with => 30)
      fill_in("Name", :with => "PlayPals")
      fill_in("Minimum Age", :with => 18)

      click_on("Save")

      page.should have_content("Maximum Age can't be blank")
    end
  end

  describe "edit/update" do
    it "allows you to edit the program" do
      program = FactoryGirl.create(:program, :name => "PenPals", :maximum_participants => 25, :minimum_age => 10, :maximum_age => 15)
      visit(edit_program_path(program))

      page.should have_field("Name", :with => "PenPals")
      page.should have_field("Maximum Number of Participants", :with => "25")

      fill_in("Maximum Number of Participants", :with => 30)
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

    it "shows validation errors" do
      program = FactoryGirl.create(:program, :name => "PenPals", :maximum_participants => 25, :minimum_age => 10, :maximum_age => 15)
      visit(edit_program_path(program))

      fill_in("Name", :with => "")

      click_on("Save")

      page.should have_content("Name can't be blank")
    end
  end
end

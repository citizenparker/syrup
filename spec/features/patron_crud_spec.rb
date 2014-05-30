require "spec_helper"

describe "patron Create/Read/Update", :type => :feature do
  describe "index" do
    it "lists patrons as links to view them" do
      patron = FactoryGirl.create(:patron, :name => "Steven Ambrose")

      visit "/patrons"
      click_on("Steven Ambrose")
      current_path.should == patron_path(patron)
    end

    it "allows you to create new patrons" do
      visit "/patrons"
      click_on("New Patron")
      current_path.should == new_patron_path
    end
  end

  describe "show" do
    before(:each) do
      @patron = FactoryGirl.create(:patron,
                                   :name => "Steven Ambrose",
                                   :age => 25,
                                   :phone_number => "+1 573 268 5192",
                                   :address_street => "123 L'rue",
                                   :address_city => "Bastonne",
                                   :address_zipcode => "00001")
    end

    it "lists details about the patron" do
      visit("/patrons/#{@patron.id}")

      page.should have_content("Steven Ambrose")
      page.should have_content(25)
      page.should have_content("123 L'rue")
      page.should have_content("+1 573 268 5192")
      page.should have_content("Bastonne")
      page.should have_content("00001")
    end

    it "contains a link to edit the patron" do
      visit("/patrons/#{@patron.id}")

      click_on("Edit")
      current_path.should == edit_patron_path(@patron)
    end
  end

  describe "new/create" do
    it "allows you to create a patron" do
      visit(new_patron_path)

      fill_in("Name", :with => "Doogie Howser")
      fill_in("Age", :with => 15)
      fill_in("Phone Number", :with => "+1 573 268 5192")
      fill_in("Street Address", :with => "123 Main St.")
      fill_in("City", :with => "Roanoke")
      fill_in("Zipcode", :with => "20105")

      click_on("Save")
      patron = Patron.where(:name => "Doogie Howser").first
      current_path.should == patron_path(patron)

      page.should have_content("Doogie Howser")
      page.should have_content(15)
      page.should have_content("+1 573 268 5192")
      page.should have_content("123 Main St.")
      page.should have_content("Roanoke")
      page.should have_content("20105")
    end

    it "shows validation errors" do
      visit(new_patron_path)

      fill_in("Name", :with => "Doogie Howser")
      fill_in("Age", :with => 15)
      fill_in("Phone Number", :with => "+1 573 268 5192")
      fill_in("City", :with => "Roanoke")
      fill_in("Zipcode", :with => "20105")

      click_on("Save")

      page.should have_content("Street Address can't be blank")
    end
  end

  describe "edit/update" do
    it "allows you to edit the patron" do
      patron = FactoryGirl.create(:patron, :name => "Harry Potter", :age => 15, :address_city => "Londonderry")
      visit(edit_patron_path(patron))

      page.should have_field("Name", :with => "Harry Potter")
      page.should have_field("Age", :with => "15")
      page.should have_field("City", :with => "Londonderry")

      fill_in("Name", :with => "Gaius Marius")
      fill_in("Age", :with => 38)
      fill_in("Phone Number", :with => "+1 573 268 5192")
      fill_in("Street", :with => "123 Mars Hill")
      fill_in("City", :with => "Rome")
      fill_in("Zipcode", :with => "12345")

      click_on("Save")
      current_path.should == patron_path(patron)

      page.should have_content("Gaius Marius")
      page.should have_content(38)
      page.should have_content("+1 573 268 5192")
      page.should have_content("123 Mars Hill")
      page.should have_content("Rome")
      page.should have_content("12345")
    end

    it "shows validation errors" do
      patron = FactoryGirl.create(:patron)
      visit(edit_patron_path(patron))

      fill_in("Name", :with => "")

      click_on("Save")

      page.should have_content("Name can't be blank")
    end
  end
end

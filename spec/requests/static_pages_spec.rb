require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Home'" do
      visit root_path
      expect(page).to have_content('Home')
    end

    it "should have the base title" do
      visit root_path
      expect(page).to have_title("Pollapick")
    end

    it "should not have a custom page title" do
      visit root_path
      expect(page).not_to have_title('| Home')
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      visit help_path
      expect(page).to have_title("Pollapick | Help")
    end
  end

  describe "About page" do

    it "should have the content 'About Pollapick'" do
      visit about_path
      expect(page).to have_content('About Pollapick')
    end

    it "should have the title 'About Pollapick'" do
      visit about_path
      expect(page).to have_title("Pollapick | About Pollapick")
    end
  end

  describe "Contact page" do

    it "should have the content 'Contact'" do
      visit contact_path
      expect(page).to have_content('Contact')
    end

    it "should have the title 'Contact'" do
      visit contact_path
      expect(page).to have_title("Pollapick | Contact")
    end
  end
end
require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_content('Home')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title("Pollapick | Home")
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("Pollapick | Help")
    end
  end

  describe "About page" do

    it "should have the content 'About Pollapick'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Pollapick')
    end

    it "should have the title 'About Pollapick'" do
      visit '/static_pages/about'
      expect(page).to have_title("Pollapick | About Pollapick")
    end
  end
end
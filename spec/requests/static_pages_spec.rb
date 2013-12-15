require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Home page" do 

    before {  visit root_path }

    it { should have_selector('h1', text:'Sample App') }

    it { should have_selector('title', 
                                text: full_title('')) }
    
    it { page.should_not have_selector 'title', :text => '| Home' }
    
  end

  describe "Help page" do 
      before { visit help_path }

      it { should have_selector('h1', text: 'Help')}
      it { should have_selector('title', 
                               text: full_title('')) }
  end

  describe "About page" do

      before { visit about_path }
      it { should have_selector('h1', :text => 'About Us') }


      it { should have_selector('title',
                               :text => full_title('About Us')) }
  end

  describe "Contract page" do 

      before { visit contract_path } 
      it { should have_selector('h1', text: 'Contract') }

      it { should have_selector('title', 
                               text: full_title('Contract')) }
  end
end

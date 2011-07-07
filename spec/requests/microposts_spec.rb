require 'spec_helper'

describe "Microposts" do
  
  before(:each) do
    user = Factory(:user)
    visit signin_path
    fill_in :email, :with => user.email
    fill_in :password, :with => user.password
    click_button
  end

describe "creation" do

  describe "failure" do
    it "should not make a new micropost" do
      lambda do
        visit root_path
        fill_in :micropost_item, :with => ""
        fill_in :micropost_description, :with => "" 
        fill_in :micropost_location, :with => "" 
        fill_in :micropost_contact, :with => ""
        click_button
        response.should render_template('pages/home')
        response.should have_selector("div#error_explanation")
      end.should_not change(Micropost, :count)
    end
  end

  describe "success" do
    it "should make a new micropost" do
      content = "Lorem ipsum dolor sit amet"
      lambda do
        visit root_path
        fill_in :micropost_item, :with => content
        fill_in :micropost_description, :with => content
        fill_in :micropost_location, :with => content
        fill_in :micropost_contact, :with => content
        click_button
        response.should have_selector("span.content", :content => content)
      end.should change(Micropost, :count).by(1)
    end
  end
end
end
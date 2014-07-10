require 'spec_helper'

describe 'a user can search for a keyword' do

  it "will add a hospital to favorites" do
    visit "/"
    fill_in "search_text", with: "jibe"
    click_button "Search"

    expect(page).to have_content "Search Results List"
  end

end
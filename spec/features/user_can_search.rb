require 'spec_helper'

describe 'a user can search for a keyword' do

  it "will return search results" do
    visit "/"
    fill_in "search_term", with: "jibe"
    click_button "Search"

    expect(page).to have_content "Search Results List"
  end

end
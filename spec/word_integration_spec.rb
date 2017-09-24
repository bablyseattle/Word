require './app'
require 'capybara/rspec'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Word Page', {:type => :feature}) do
  it("shows form to add new word") do
    visit('/')
    click_link("Add new word")
    expect(page).to have_content("Add word and definition:")
  end
end

describe('Form Page', {:type => :feature}) do
  it("add a new word and display in list") do
    visit('/new')
    fill_in('word', :with => "hi")
    fill_in('definition1', :with => "a greeting")
    click_button("Submit")
    expect(page).to have_content("hi")
  end
end

describe('Definitions page', {:type => :feature}) do
  it("when word is clicked it goes to definitions page") do
    visit('/')
    fill_in('word', :with => "villain")
    click_button("Add word!")
    click_link('villain')
    expect(page).to have_content("villain")
  end
end

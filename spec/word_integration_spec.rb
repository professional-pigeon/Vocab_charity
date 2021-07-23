require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add a word path', {:type => :feature}) do
  it('creates a word then goes to the word page') do
    visit('/words')
    click_on("Add Your Word")
    fill_in('word_name', :with => 'Duck')
    fill_in('meaning', :with => 'a cute waterfowl: quack quack')
    click_on('Add Your Word')
    expect(page).to have_content('Duck')
  end
end

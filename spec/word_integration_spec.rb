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

describe('update a word path', {:type => :feature}) do
  it('creates a word then goes to the word page') do
    word1 = Word.new("duck", "it quacks", nil)
    visit('/words')
    click_on("duck")
    click_on('Change word or definition')
    
    expect(page).to have_content('Duck')
  end
end

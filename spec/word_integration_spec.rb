require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add a word path', {:type => :feature}) do
  it('creates a word and adds it to the word page') do
    visit('/words')
    fill_in('word_name', :with => 'Duck')
    click_on('Add Your Word')
    expect(page).to have_content('Duck')
  end
end

# describe('update a word path', {:type => :feature}) do
#   it('navigates to the word/id update page and updates the meaning') do
#     word1 = Word.new({:word => "duck", :meaning => "it quacks"}, nil)
#     word1.save
#     visit('/words')
#     click_on('duck')
#     click_on('Change or add definitions')
#     fill_in('meaning', :with => 'A pretty bird')
#     click_on('Update Definition')
#     expect(page).to have_content('A pretty bird')
#   end
# end

# describe('delete a word path', {:type => :feature}) do
#   it('navigates to the word/:id and deletes it') do
#     Word.clear
#     word1 = Word.new({:word => "duck", :meaning => "it quacks"}, nil)
#     word1.save
#     visit('/words')
#     click_on('duck')
#     click_on('Delete Word')
#     expect(page).to have_content('There are no words yet, but you can be the first!')
#   end
# end

# describe('add an additiona meaning to word path', {:type => :feature}) do
#   it('adds an additional meaning to a word') do
#     Word.clear
#     word1 = Word.new({:word => "duck", :meaning => "it quacks"}, nil)
#     word1.save
#     visit('/words')
#     click_on('duck')
#     click_on('Change or add definitions')
#     fill_in('meaning_new', :with => "it also flies!" )
#     click_on('Add Definition')
#     expect(page).to have_content('it also flies!')
#   end
# end



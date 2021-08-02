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

describe('update a word path', {:type => :feature}) do
  it('navigates to the word update page and updates the word spelling') do
    word1 = Word.new({:word => "duck"}, nil)
    word1.save
    visit('/words')
    click_on('duck')
    fill_in('spelling', :with => 'hawk')
    click_on('Update Word')
    expect(page).to have_content('HAWK')
  end
end

describe('delete a word path', {:type => :feature}) do
  it('navigates to the word/:id and deletes it') do
    Word.clear
    word1 = Word.new({:word => "duck"}, nil)
    word1.save
    visit('/words')
    click_on('duck')
    click_on('Delete Word')
    expect(page).to have_content('There are no words yet, but you can be the first!')
  end
end

describe('add a meaning to a word path', {:type => :feature}) do
  it('adds a meaning to a word') do
    Word.clear
    word1 = Word.new({:word => "duck"}, nil)
    word1.save
    visit('/words')
    click_on('duck')
    fill_in('def_name', :with => "it also flies!" )
    click_on('Add Your Definition')
    expect(page).to have_content('it also flies!')
  end
end

describe('change the meaning of a word path', {:type => :feature}) do
  it('changes the meaning of a word') do
    Word.clear
    word1 = Word.new({:word => "duck"}, nil)
    word1.save    
    definition1 = Definition.new({:meaning => "it quacks", :word_id => word1.id}, nil)
    definition1.save
    visit('/words')
    click_on('duck')
    click_on('it quacks')
    fill_in('new_def', :with => "it quacks loud!" )
    click_on('Update Definition')
    expect(page).to have_content('it quacks loud!')
  end
end

describe('change the meaning of a word path', {:type => :feature}) do
  it('changes the meaning of a word') do
    Word.clear
    Definition.clear
    word1 = Word.new({:word => "duck"}, nil)
    word1.save    
    definition1 = Definition.new({:meaning => "it quacks", :word_id => word1.id}, nil)
    definition1.save
    visit('/words')
    click_on('duck')
    click_on('it quacks')
    click_on('Delete Definition')
    expect(page).to have_content('No definitions yet!')
  end
end







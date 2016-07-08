require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

def expect_page(arr)
  arr.each() do |element|
    expect(page).to have_content(element)
  end
end

describe('viewing the root path', {:type => :feature}) do
  it('renders the index view') do
    visit('/')
    expect_page(["list of all you words", "Dictionary", "add a new word to the dictionary"])
  end

  it('goes to the word form page when you press the add new word link') do
    visit('/')
    click_link("add a new word to the dictionary")
    expect_page(["Add a word", "New Word"])
  end

  it('fill in the word and then submit and the page to post the new word to the server returning you got the home page with the new word added apearing') do
    visit('/')
    click_link("add a new word to the dictionary")
    fill_in("word", :with => "fuck")
    click_button("Add")
    expect_page(["fuck", "list of all you words", "Dictionary", "add a new word to the dictionary"])
  end
end

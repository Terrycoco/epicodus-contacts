require('capybara/rspec')
require('./app')
require('launchy')
require('pry')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('contact path', {:type => :feature}) do
  before () do
    Contact.clear
  end

  it('serves the index page which will show contact list') do
    visit('/')
    fill_in('first', :with => 'Terry')
    fill_in('last', :with => 'Marr')
    click_button('Add')
    expect(page).to have_content('Terry Marr')
  end


end

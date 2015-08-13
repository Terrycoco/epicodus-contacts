require('sinatra')
require('sinatra/reloader')
require('./lib/address.rb')
require('./lib/contact.rb')
also_reload('lib/**/*.rb')
require('pry')


get('/') do
  @contacts = Contact.all()
  erb(:index)
end

post('/new_contact') do
  first = params.fetch('first')
  last = params.fetch('last')
  company = params.fetch('company','')
  title = params.fetch('title','')
  Contact.new(last, first, {:company => company, :title => title}).save()
  @contacts = Contact.all()
  erb(:index)
end

get('/contact_detail/:id') do
  id = params.fetch('id').to_i
  @contact = Contact.find(id)
  erb(:contact_detail)


end

class Contact
  @@contacts = []

#instance methods and properties
  define_method(:initialize) do |last, first, attributes = {}|
    @last = last
    @first = first
    @company = attributes.fetch(:company, '')
    @title = attributes.fetch(:title, '')
    @addresses = attributes.fetch(:add_address, [])
  end

  define_method(:last) do
    @last
  end

  define_method(:first) do
    @first
  end

  define_method(:fullname) do
    @fullname = @first.concat(" ").concat(@last)
  end

  define_method(:save) do
    @@contacts.push(self)
  end

  define_method(:company) do
    @company
  end

  define_method(:title) do
    @title
  end

  define_method(:addresses) do
    @addresses
  end
  define_method(:add_address) do |test_address|
    @addresses.push(test_address)
  end



#class methods
  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_singleton_method(:all) do
    @@contacts
  end


end

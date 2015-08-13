class Contact
  @@contacts = []
  @@counter = 0

#instance methods and properties
  define_method(:initialize) do |last, first, attributes = {}|
    @last = last
    @first = first
    @company = attributes.fetch(:company, '')
    @title = attributes.fetch(:title, '')
    @addresses = attributes.fetch(:add_address, [])
    @fullname = first + " " + last
    @id = new_id()

  end
  define_method(:new_id) do
    @@counter += 1
  end

  define_method(:id) do
    @id
  end

  define_method(:last) do
    @last
  end

  define_method(:first) do
    @first
  end

  define_method(:fullname) do
    @fullname
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

  define_singleton_method(:find) do |id|
    @@contacts.each() do |contact|
      if contact.id() == id
          return contact
      end
    end
 end

end  #end class

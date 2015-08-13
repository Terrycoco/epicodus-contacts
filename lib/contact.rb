class Contact
  @@contacts = []

#instance methods and properties
  define_method(:initialize) do |last, first, attributes = {}|
    @last = last
    @first = first
    @company = attributes.fetch(:company, '')
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



#class methods
  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_singleton_method(:all) do
    @@contacts
  end


end

class Address
  @@addresses = []

  define_method(:initialize) do | tag, attribute = {}|
    @tag = tag
    @street1 = attribute.fetch(:street1, '')
    @street2 = attribute.fetch(:street2, '')
    @city = attribute.fetch(:city, '')
    @state = attribute.fetch(:state, '')
    @zip = attribute.fetch(:zip, '')
  end

  define_method(:tag) do
    @tag
  end

  define_method(:street1) do
    @street1
  end
  define_method(:street2) do
    @street2
  end
  define_method(:city) do
    @city
  end
  define_method(:state) do
    @state
  end
  define_method(:zip) do
    @zip
  end
  define_method(:save) do
    @@addresses.push(self)
  end

  define_singleton_method(:clear) do
    @@addresses = []
  end
  define_singleton_method(:all) do
    @@addresses
  end

end

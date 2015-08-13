require ("rspec")
require ("contact")
require("address")
require ("pry")


describe("contact") do

  before() do
    Contact.clear
  end

  describe("#initialize") do
    it("creates a new contact with first and last name") do
      test_contact = Contact.new('Smith', 'John')
      expect(test_contact.fullname()).to(eq('John Smith'))
    end
  end


  describe("#save") do
    it("save contact to the contacts collection") do
      test_contact = Contact.new('Smith', 'John')
      test_contact.save()
      expect(Contact.all().include?(test_contact)).to(eq(true))
    end
  end

 describe("#company") do
   it("adds a new attribute company to the contact") do
     test_contact = Contact.new('Smith', 'John', {:company => 'ABC Corp'})
     expect(test_contact.company()).to(eq('ABC Corp'))
   end
 end

 describe("#title") do
   it("adds a new sttribute job title to the contact") do
     test_contact = Contact.new('Smith', 'Jim', {:title => 'engineer'})
     expect(test_contact.title()).to(eq('engineer'))
   end
 end

 describe("#add_address") do
   it("adds a new address to a contact") do
     test_contact = Contact.new('Smith', 'John')
     test_address = Address.new('home', {:street1 => '2324 SE Salmon', :street2 => 'room 3'})
     test_address.save()
     test_contact.add_address(test_address)
     expect(test_contact.addresses().include?(test_address)).to(eq(true))
   end
 end

end

describe("address") do
  before() do
    Address.clear
  end

  describe("#initialize") do
    it("creates an address with street1, street2, city, state, zip") do
      test_address = Address.new('home',
        {:street1 => '280 Riverside Drive',
         :street2 => 'Apt 15E',
         :city => 'New York',
         :state => 'NY',
         :zip => '10025'})
      expect(test_address.street2()).to(eq('Apt 15E'))
    end

  end

  describe('#initalize') do
    it("creates a new address with some attributes missing") do
      test_address = Address.new('work',{:street1 => 'PO Borspecx 1343'})
      expect(test_address.street2()).to(eq(''))
    end
  end

  describe('#save') do
    it('saves the new address to the collection of addresses') do
      test_address = Address.new('work',{:street1 => 'PO Borspecx 1343'})
      test_address.save()
      expect(Address.all().include?(test_address)).to(eq(true))
    end
  end

end

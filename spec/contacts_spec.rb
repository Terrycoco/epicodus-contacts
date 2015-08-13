require ("rspec")
require ("contact")
require ("pry")


describe("contact") do

  before() do
    Contact.clear
  end

  describe("#initialize") do
    it("creates a new contact with first and last name") do
      test_contact = Contact.new({:last => 'Smith', :first => 'John'})
      expect(test_contact.fullname()).to(eq('John Smith'))
    end
  end


  describe("#save") do
    it("save contact to the contacts collection") do
      test_contact = Contact.new({:last => 'Smith', :first => 'John'})
      test_contact.save()
      expect(Contact.all().include?(test_contact)).to(eq(true))
    end
  end

 describe("#company") do
   it("adds a new attribute company to the contact") do
     test_contact = Contact.new({:last => 'Smith', :first => 'John', :company => 'ABC Corp'})
     expect(test_contact.company()).to(eq('ABC Corp'))
   end
 end



end

 require_relative '../models/address_book'

 RSpec.describe AddressBook do  
   describe "attributes" do
     it "should respond to entries" do
       book = AddressBook.new
       expect(book).to respond_to(:entries)
     end

     it "should initialize entries as an array" do
       book = AddressBook.new
       expect(book.entries).to be_a(Array)
     end

     it "should initialize entries as empty" do
       book = AddressBook.new
       expect(book.entries.size).to eq(0)
     end
   end
   
   describe "#remove_entry" do
       it "removes an entry by name, phone_number, and email" do
           address = AddressBook.new
           address.add_entry("Billy Bob", "555-000-1111", "bb@billybob.com" )
           
           name= "me you"
           phone_number = "999-999-9999"
           email_address = "me@meohmy.com"
           
           address.add_entry(name, phone_number,email_address)
           
           expect(address.entries.size).to eq 2
           address.remove_entry(name, phone_number, email_address)
           expect(address.entries.size).to eq 1
           expect(address.entries.first.name).to eq("Billy Bob")
       end
   end
   
   
   describe "#add_entry" do
     it "adds only one entry to the address book" do
       book = AddressBook.new
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
 
       expect(book.entries.size).to eq(1)
     end
 
     it "adds the correct information to entries" do
       book = AddressBook.new
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       new_entry = book.entries[0]
 
       expect(new_entry.name).to eq('Ada Lovelace')
       expect(new_entry.phone_number).to eq('010.012.1815')
       expect(new_entry.email).to eq('augusta.king@lovelace.com')
     end
   end
 end
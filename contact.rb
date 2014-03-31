class Contact
	@@customer = 1000		#implement the IDnumber

	attr_accessor :id, :first_name, :last_name, :email, :notes 

	def initialize
		@id = Contact.get_id
	end

	def to_s 	#to_s overrides
		"ID: #{@id}\nFirst Name: #{@first_name}\nLast Name: #{@last_name}\nEmail: #{@email}\nNotes: #{@notes}"
	end 		#\n (new line character) creates a new line

	def self.get_id   #self: way to create a class method
		@@customer += 1 	 #customer id will increment 1000 by 1
		@@customer
	end

end
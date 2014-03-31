class Rolodex
	def initialize
		@contacts = []		#empty array to accept new contacts
		@id = 1000
	end

	def create_contact(first_name, last_name, email, notes)	#adding a contact
		contact = Contact.new	#do Contact.new to create a new object (contact)
		contact.first_name = first_name
		contact.last_name = last_name
		contact.email = email
		contact.notes = notes+"\n"
		@contacts << contact 	#pushes the new contact into the array
	end

	def display_contacts		#display all contacts
		@contacts.each do |contact|
			puts contact
		end
	end

	def delete_contact(id)		#delete a contact
		@contacts.delete_if {|c| c.id == id}
	end

	def show_specific_contact(id)		#display a specific contact
		@contacts.each do |contact|
			if contact.id == id
			puts contact
			end
		end
	end

	def display_byattribute_name			#display contacts by attribute
		@contacts.each do |contact|
			puts contact.last_name + "," +contact.first_name
		end
	end

	def display_byattribute_email			#display contacts by attribute
		@contacts.each do |contact|
			puts contact.email
		end
	end

	def edit_first_name(id, first_name)
		@contacts.each do |contact|
			if contact.id == id
				contact.first_name = first_name
			end
		end
	end

	def edit_last_name(id, last_name)
		@contacts.each do |contact|
			if contact.id == id
				contact.last_name = last_name
			end
		end
	end

	def edit_email(id, email)	
		@contacts.each do |contact|
			if contact.id == id
				contact.email = email
			end
		end
	end

	def edit_notes(id, notes)
		@contacts.each do |contact|
			if contact.id == id
				contact.notes = notes
			end
		end
	end
end

#
#    def remove_contact(id)       #nn intro a concept of an ID/id
#         result = nil
#         @contacts.each do |contact|
#              if contact.id == id
#                  result = contact
#              end
#         end
#         @contacts.delete(result) if result != nil
#    end

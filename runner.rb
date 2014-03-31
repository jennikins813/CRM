require './rolodex'			#references the rolodex.rb file
require './contact'			#references the contact.rb file

class Runner  				 	# this is the customer/user interface
	def initialize		    	#need rolodex to go thru user database
		@rolodex = Rolodex.new		#initialize to create a rolodex
	end

	def main_menu
		puts " CRM Main Menu - Select an option below: "
		puts "[1] Add a new contact" 			
		puts "[2] Display all contacts" 		
		puts "[3] Delete a contact" 			
		puts "[4] Edit an existing contact" 	
		puts "[5] Display a specific contact"
		puts "[6] Display contacts by Field"
		puts "[0] To Exit"
	end

	def add_contact
		puts "Enter First Name:"			# step 1 in main menu
		first_name = gets.chomp
		puts "Enter Last Name:"
		last_name = gets.chomp
		puts "Enter Email:"
		email = gets.chomp
		puts "Enter Notes:"
		notes = gets.chomp
		@rolodex.create_contact(first_name, last_name, email, notes)   
	end 			#nn def create_contact in class Rolodex

	def display_contacts
		puts "\e[H\e[2J"
		puts "All Contacts:"			# step 2 in the main menu
		@rolodex.display_contacts	#nn def in class Rolodex n Contacts
		puts "\n"	 				#adds a break/blank line
	end

	def delete_contact_1
		puts "\e[H\e[2J"
		done = false
		while done != true
			puts "Enter customer ID to delete it:"
			id = gets.chomp.to_i
			puts "You want to delete ID number #{id}. Is this correct? ('yes' to delete/'no' to cancel)"
			reply = gets.chomp.downcase
			if reply == "no"
				done = true
			else
				puts "ID number #{id} is now deleted."
				@rolodex.delete_contact(id)
				done = true
			end
		end
	end

	def show_specific_contact
		puts "\e[H\e[2J"
		puts "Enter customer ID to show details:"
		id = gets.chomp.to_i
		@rolodex.show_specific_contact(id)
	end

	def display_byattribute
		puts "\e[H\e[2J"
		puts "How do you want to display the contact list? (by Name, by Email)?"
		attribute = gets.chomp.capitalize
		if attribute == "Name"
		puts "\e[H\e[2J"
		puts "Here are the contacts by Name:"
		@rolodex.display_byattribute_name
		puts "\n"
		elsif attribute == "Email"
		puts "Here are the contacts Email:"
		@rolodex.display_byattribute_email
		puts "\n"
		end
	end

	def edit_menu
		puts " CRM Edit Menu - Select an option below:"
		puts "[1] Edit First Name" 		
		puts "[2] Edit Last Name"
		puts "[3] Edit Email"
		puts "[4] Edit Notes" 
		puts "[0] Return to Main Menu"
	end

	def edit_contact
		puts "\e[H\e[2J"
		puts "Enter customer ID to begin edit:"
		id = gets.chomp.to_i
		puts "You want to edit ID number #{id}. Is this correct? ('yes' to edit/'no' to cancel edit)"
		reply = gets.chomp.downcase
		if reply == "no"
			return "" 					#if you put main_menu, it'll return both main_menu and edit_menu..
		end 								#the return "" will just return you to main_menu
		puts "\n"
		puts "Taking you to the Edit Menu..."
		puts "\n"
		done = false
		while !done
			edit_menu
		   input = gets.chomp.to_i
		   if input == 0		#exit option on edit menu
		  	 done = true
		  	 puts "\n" 	    #takes user back to main menu == OK!
		   elsif input == 1  		#edit first name option from edit menu === OK!
		    puts "Enter New First Name" 
		  	 first_name = gets.chomp
		  	 @rolodex.edit_first_name(id, first_name)
		   elsif input == 2	
		  	 puts "Enter New Last Name" 
		  	 last_name = gets.chomp
		  	 @rolodex.edit_last_name(id, last_name)
		   elsif input == 3
		  	 puts "Enter New Email" 
		  	 email = gets.chomp
		  	 @rolodex.edit_email(id, email)
		   elsif input == 4
		  	 puts "Enter New Notes" 
		  	 notes = gets.chomp
		  	 @rolodex.edit_notes(id, notes)
		   end
		end
	end

	def run  						# method will get crm starting 
		done = false
		while !done					#while to loop
		  main_menu
		  input = gets.chomp.to_i
		  if input == 0				#exit option on main menu
		  	done = true
		  	puts "Thank you! Have a nice day!"
		  elsif input == 1  		#Add a contact (add_contact) on main menu
		  	add_contact
		  elsif input == 2	
		  	display_contacts
		  elsif input == 3
		  	delete_contact_1
		  elsif input == 4
		  	edit_contact
		  elsif input == 5
		  	show_specific_contact
		  else input == 6
		  	display_byattribute
		  end
		end
	end
end

#call the methods inside the classes, like this:
runner = Runner.new
runner.run 		#calls the run method
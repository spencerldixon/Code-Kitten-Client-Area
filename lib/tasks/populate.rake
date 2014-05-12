task :populate => :environment do
		if Rails.env.production?
			puts "Cannot run this task in the production environment"
		else
			User.delete_all

			User.create!(
				first_name: "John",
				last_name: "Johnson",
				business_name: "TestCo Ltd",
				email: "user@test.com", 
				password: "test1234",
				password_confirmation: "test1234"
			)

			User.create!(
				first_name: "Dave",
				last_name: "Davidson",
				business_name: "TestCo Ltd",
				email: "admin@test.com",
				password: "test1234",
				password_confirmation: "test1234",
				admin: true
			)

			puts "Two users created successfully!"
		end
	end

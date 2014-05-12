task :populate => :environment do
	if Rails.env.production?
		puts "Cannot run this task in the production environment"
	else
		User.delete_all
		Project.delete_all

		john = User.create!(
			first_name: "John",
			last_name: "Johnson",
			business_name: "TestCo Ltd",
			email: "user1@test.com", 
			password: "test1234",
			password_confirmation: "test1234"
		)

		carl = User.create!(
			first_name: "Carl",
			last_name: "Carlson",
			business_name: "Carlson Enterprises",
			email: "user2@test.com", 
			password: "test1234",
			password_confirmation: "test1234"
		)

		admin = User.create!(
			first_name: "Dave",
			last_name: "Davidson",
			business_name: "Code Kitten",
			email: "admin@test.com",
			password: "test1234",
			password_confirmation: "test1234",
			admin: true
		)

		Project.create!(name: "Carlson Enterprises Website", user: carl)
		Project.create!(name: "John's Website", user: john)

		puts "Users and Projects created successfully!"
	end
end

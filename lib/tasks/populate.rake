task :populate => :environment do
	if Rails.env.development?
		purge
		create_admin
		create_users
		create_projects
		create_invoices
		puts "Database populated successfully!"
	else
		puts "Cannot run this task in the test or production environments!"
	end
end

def purge
	Rake::Task['db:reset'].invoke
	puts "Database reset successfully"
end

def create_admin
	User.create!(
		first_name: "Admin",
		last_name: "Adminson",
		business_name: "Code Kitten",
		email: "admin@test.com",
		password: "test1234",
		password_confirmation: "test1234",
		admin: true
	)
	puts "Admin user created"
end

def create_users
	5.times do |n|
		email = "user#{n+1}@test.com"
		password = "test1234"
		first_name = Faker::Name.first_name
		last_name = Faker::Name.last_name
		business_name = Faker::Company.name


		User.create!(
			first_name: first_name,
			last_name: last_name,
			business_name: business_name,
			email: email,
			password: password,
			password_confirmation: password
		)
	end
	puts "5 Client users created"
end

def create_projects
	users = User.all
	users.each { |user| user.projects.create!(name: "#{Faker::Company.name} Website" ) }
	puts "Project created for each user"
end

def create_invoices
	projects = Project.all
	projects.each { |project| project.invoices.create!(amount: Faker::Number.number(3), note: "Invoice for #{project.name}") }
	puts "Invoice created for each project"
end
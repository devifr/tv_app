# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
puts 'Begin Create Admin...'
  admin = Admin.find_or_initialize_by(email: 'admin@example.net')
  admin.password = 12345678
  if admin.save
    puts 'Admin Has Created With email admin@example.net and password 12345678'
  else
    puts "Admin Failed to Created #{admin.errors.full_message}"
  end
puts 'Finish'

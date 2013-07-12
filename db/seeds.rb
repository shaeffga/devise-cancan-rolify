# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Jim.destroy_all
Mike.destroy_all
Leo.destroy_all

# Create Complaint
puts ""
puts "Creating Complaint"

# Jims rants
one_complaint = Jim.create issue: "Can't talk to Gages mother", complaining: "I am just to scared to talk to her. I just am to shy I guess."

# Mikes rants
one_complaint = Mike.create issue: "Gage keeps bothering me.", complaining: "Gage keeps asking me questions. I will hit him."

one_complaint = Leo.create issue: "Larre", complaining: "Freaking Larre is acting up..... AGAIN!"
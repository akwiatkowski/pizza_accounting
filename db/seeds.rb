# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = %w{
l@pizzaaccount.pl
o@pizzaaccount.pl
w@pizzaaccount.pl
t@pizzaaccount.pl
}

users.each do |u|
  User.create!(email: u, password: u, password_confirmation: u) unless User.find_by_email(u)
end

users = users.collect{|u| User.find_by_email(u)}
g = User.find_by_email('o@pizzaaccount.pl').owned_group
g.users = users
g.save
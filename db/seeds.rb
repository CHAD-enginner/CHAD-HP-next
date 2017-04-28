# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Adminuser.create!(id: 1, email: 'cambodiachad0917@gmail.com', password: 'cambodia0917', password_confirmation: 'cambodia0917')
# Adminuser.create!(id: 2, email: 'rinpe-edit@gmail.com', password: 'rinpe-edit', password_confirmation: 'rinpe-edit')


require "csv"

adkiseis_csv = CSV.readlines("db/adkiseis.csv")
adkiseis_csv.shift
adkiseis_csv.each do |row|
  Adkisei.create(name: row[1], text: row[2], backimage: row[3])
end

# adusers_csv = CSV.readlines("db/adusers.csv")
# adusers_csv.shift
# adusers_csv.each do |user|
#   Aduser.create(name: user[1], university: user[2], studentnumber: user[3], role: user[4], email: user[5], adress: user[6], phone: user[7], avator: user[8], adkisei_id: user[9])
# end
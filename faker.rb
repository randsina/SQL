require 'faker'
require 'as-duration'

p 'Companies:'
p '-' * 80
4.times do
  p Faker::Company.name
  p "#{Faker::Number.decimal(10, 2)} USD"
end
p '*' * 80

p 'Departments:'
p '-' * 80
6.times { p Faker::Company.name }
p '*' * 80

p 'Employees:'
p '-' * 80
12.times do
  p Faker::Number.number(4).to_i.round(-2)
  p Faker::Number.between(30, 50)
  puts
end
p '*' * 80

p 'Personal Informations:'
p '-' * 80
12.times do
  p Faker::Time.between(10.years.ago, Time.now, :all).strftime('%F')
  p Faker::Time.between(60.years.ago, 20.years.ago, :all).strftime('%F')
  p "#{Faker::Company.duns_number}-#{Faker::Company.swedish_organisation_number}"
  p Faker::Name.first_name
  p Faker::Name.last_name
  puts
end
p '*' * 80

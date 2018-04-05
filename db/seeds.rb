User.create!(name: 'Derrick Suarez',
             email: 'suarez.derrick@gmail.com',
             password: 'password',
             password_confirmation: 'password')

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@dbseeds.com"
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end
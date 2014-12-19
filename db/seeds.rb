User.create!(name:  "admin",
    email: "admin@yahoo.com",
    password:              "123456",
    password_confirmation: "123456",
    admin: true)
50.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@gmail.com"
    password = "123456"
    admin = "0"
User.create!(name:  name,
    email: email,
    password:              password,
    password_confirmation: password, admin: admin)
end
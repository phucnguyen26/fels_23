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
40.times do |i|
  Category.create(name: "Category#{i+1}", description: "Description#{i+1}")
end
50.times do |i| 
  Word.create(name: "Word#{i+1}", meaning: "meaning#{i+1}", category_id: "#{1}")
end
50.times do |i| 
  Answer.create(content: "VN_word_meaning#{i+1}", word_id: i+1, is_correct: true)
  3.times do |j|
      Answer.create(content: "Answer#{i+j*50}", word_id: i , is_correct: false)
  end
end
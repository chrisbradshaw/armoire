10.times do
  User.new(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password(8))
end

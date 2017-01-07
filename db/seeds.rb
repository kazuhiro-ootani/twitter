10.times do
User.create!(username:  Faker::Pokemon.name,
             nickname:  Faker::Pokemon.name,
             email: Faker::Internet.email,
             password:              "testtest",
             created_at: Time.zone.now)
end

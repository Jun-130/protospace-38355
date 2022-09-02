FactoryBot.define do
  factory :user do
    name       {Faker::Name.last_name}
    profile    {Faker::Lorem.sentence}
    occupation {Faker::Lorem.sentence}
    position   {Faker::Lorem.sentence}
    email      {Faker::Internet.free_email}
    password   {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end
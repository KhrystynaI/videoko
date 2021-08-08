FactoryBot.define do
  factory :user, class: Spree::User do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
  end
end

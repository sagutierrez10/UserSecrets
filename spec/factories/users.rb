FactoryBot.define do
  factory :user do
    name { "Monica Geller" }
    email { "monica@mail.com" }
    password { "password" }
    password_confirmation { "password"}
  end
end

Fabricator(:user) do
  email { Faker::Internet.email }
  password 'password'
  username { Faker::Name.name }
  first_name { Faker::Name.name }
  last_name { Faker::Name.name }
  admin false
  client_id nil
  broker false
end
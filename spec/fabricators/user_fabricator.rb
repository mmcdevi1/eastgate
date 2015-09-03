Fabricator(:user) do
  email { Faker::Internet.email }
  password 'password'
  username 'mmcdevi1'
  first_name { Faker::Name.name }
  last_name { Faker::Name.name }
  admin false
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Client.create(name: 'Onyx Equities, LLC')
Client.create(name: 'HSA-UWC')
User.create(
  email: 'jsaraceno@onyxequities.com',
  password: 'onyxequities',
  username: 'jsaraceno',
  first_name: 'John',
  last_name: 'Saraceno',
  client_id: 1,
  admin: false
  )
User.create(
  email: 'mwjenk@aol.com',
  password: 'hsauwc11',
  username: 'mjenkins',
  first_name: 'Michael',
  last_name: 'Jenkins',
  client_id: 2,
  admin: false
  )
User.create(
  email: 'mmcdevitt@eastgate.io',
  password: 'morgantown',
  username: 'mmcdevi1',
  first_name: 'Michael',
  last_name: 'McDevitt',
  admin:true
  )
User.create(
  email: 'ouja@eastgate.io',
  password: 'morgantown',
  username: 'ouja',
  first_name: 'Ouja',
  last_name: 'LaValley',
  admin:true
  )
User.create(
  email: 'jlavalley@eastgate.io',
  password: 'morgantown',
  username: 'jlavalley',
  first_name: 'John',
  last_name: 'LaValley',
  admin:true
  )
Asset.create(
  name: '210 W 31st Street',
  summary: "It is a long established fact that a reader will
  be distracted by the readable content of a page when looking
  at its layout. The point of using Lorem Ipsum is that it has
  a more-or-less normal distribution of letters, as opposed to
  using 'Content here, content here', making it look like readable
  English. Many desktop publishing packages and web page editors
  now use Lorem Ipsum as their default model text, and a search for
  'lorem ipsum' will uncover many web sites still in their infancy.
  Various versions have evolved over the years, sometimes by accident,
  sometimes on purpose (injected humour and the like).",
  address: '210 W 31st Street',
  city: 'New York',
  state: 'New York',
  zipcode: '10001',
  property_type: 1,
  property_class: 1,
  year_built: '1976',
  size: 100000,
  client_id: 1
  )
Asset.create(
  name: 'The New Yorker Hotel',
  summary: "It is a long established fact that a reader will
  be distracted by the readable content of a page when looking
  at its layout. The point of using Lorem Ipsum is that it has
  a more-or-less normal distribution of letters, as opposed to
  using 'Content here, content here', making it look like readable
  English. Many desktop publishing packages and web page editors
  now use Lorem Ipsum as their default model text, and a search for
  'lorem ipsum' will uncover many web sites still in their infancy.
  Various versions have evolved over the years, sometimes by accident,
  sometimes on purpose (injected humour and the like).",
  address: '123 Jump Street',
  city: 'New York',
  state: 'New York',
  zipcode: '10001',
  property_type: 1,
  property_class: 1,
  year_built: '1937',
  size: 100000,
  client_id: 2
  )
Asset.create(
  name: '4 W 43rd Street',
  summary: "It is a long established fact that a reader will
  be distracted by the readable content of a page when looking
  at its layout. The point of using Lorem Ipsum is that it has
  a more-or-less normal distribution of letters, as opposed to
  using 'Content here, content here', making it look like readable
  English. Many desktop publishing packages and web page editors
  now use Lorem Ipsum as their default model text, and a search for
  'lorem ipsum' will uncover many web sites still in their infancy.
  Various versions have evolved over the years, sometimes by accident,
  sometimes on purpose (injected humour and the like).",
  address: '123 Jump Street',
  city: 'New York',
  state: 'New York',
  zipcode: '10001',
  property_type: 1,
  property_class: 1,
  year_built: '1937',
  size: 100000,
  client_id: 2
  )
Asset.create(
  name: 'Philadelphia Campus Properties',
  summary: "It is a long established fact that a reader will
  be distracted by the readable content of a page when looking
  at its layout. The point of using Lorem Ipsum is that it has
  a more-or-less normal distribution of letters, as opposed to
  using 'Content here, content here', making it look like readable
  English. Many desktop publishing packages and web page editors
  now use Lorem Ipsum as their default model text, and a search for
  'lorem ipsum' will uncover many web sites still in their infancy.
  Various versions have evolved over the years, sometimes by accident,
  sometimes on purpose (injected humour and the like).",
  address: '123 Jump Street',
  city: 'Philadelphia',
  state: 'Pennsylvania',
  zipcode: '10001',
  property_type: 1,
  property_class: 1,
  year_built: '1937',
  size: 100000,
  client_id: 2
  )

Priority.create(title: 'High')
Priority.create(title: 'Medium')
Priority.create(title: 'Low')

Approval.create(title: 'Leasehold agreement needs your approval', priority_id: 1, asset_id: 1, approved: false)
Approval.create(title: 'NDA needs your approval', priority_id: 2, asset_id: 1, approved: false)
Approval.create(title: 'Construction needs your approval', priority_id: 3, asset_id: 1, approved: false)
Approval.create(title: 'Leasehold agreement needs your approval', priority_id: 1, asset_id: 1, approved: false)
Approval.create(title: 'NDA needs your approval', priority_id: 2, asset_id: 1, approved: true)
Approval.create(title: 'Construction needs your approval', priority_id: 3, asset_id: 1, approved: true)

PropertyType.create(title: 'Retail')
PropertyType.create(title: 'Office')
PropertyType.create(title: 'Industrial')
PropertyType.create(title: 'Medical')
PropertyType.create(title: 'Hotel')
PropertyType.create(title: 'Mixed Use')
PropertyType.create(title: 'Residential')

PropertyClass.create(title: 'A')
PropertyClass.create(title: 'B')
PropertyClass.create(title: 'C')
PropertyClass.create(title: 'D')
PropertyClass.create(title: 'E')
PropertyClass.create(title: 'F')








































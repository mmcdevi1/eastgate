# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
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
  property_type: 'Hotel',
  property_class: 'A',
  year_built: '1937',
  size: 100000
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
  property_type: 'Hotel',
  property_class: 'A',
  year_built: '1937',
  size: 100000
  )
Asset.create(
  name: 'Belvedere Estates', 
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
  property_type: 'Hotel',
  property_class: 'A',
  year_built: '1937',
  size: 100000
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









































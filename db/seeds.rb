# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(username: 'Dakota', email: 'having@somelaughs.com',
  password: 'mademefeelliketheone')
second_user = User.create!(username: 'Mayer', email: 'john@mayer.com',
  password: 'wildfire')

aerospace_path = Node.build_path('Aerospace', user).path
programming_path = Node.build_path('Programming', second_user).path
wiki_url = 'http://en.wikipedia.org/wiki/Aerospace_engineering'
lecture_url = 'http://freevideolectures.com/Course/2303/Aircraft-Systems-Engineering'
nasa_url = 'http://www.nasa.gov'
forces_url = 'http://www.av8n.com/how/htm/4forces.html'
shuttle_url = 'http://www.howstuffworks.com/space-shuttle.htm'
ruby_tuts_url = 'http://tryruby.org/'
rails_intro_url = ''

# Aerospace path
# User 1
wiki_node = Node.build(wiki_url, aerospace_path, user)
lecture_node = Node.build(lecture_url, aerospace_path, user)
nasa_node = Node.build(nasa_url, aerospace_path, user)
shuttle_node = Node.build(shuttle_url, aerospace_path, user)
# User 2
nasa_node_2 = Node.build(nasa_url, aerospace_path, second_user)
forces_node = Node.build(forces_url, aerospace_path, second_user)

# Programming path
# User 1
ruby_tuts_node = Node.build(ruby_tuts_url, programming_path, user)
rails_intro_node = Node.build(rails_intro_url, programming_path, user)
wiki_node_2 = Node.build(wiki_url, programming_path, user)
# User 2
ruby_tuts_node = Node.build(ruby_tuts_url, programming_path, second_user)
forces_node_2 = Node.build(forces_url, programming_path, second_user)

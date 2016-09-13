# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
unless Crawler.exists?(url: "http://google.com.vn")
  Crawler.create!(url: "http://google.com.vn", h1_content: "H1 Content")
  Crawler.create!(url: "http://fptshop.com.vn", h1_content: "H1 Content")
  Crawler.create!(url: "http://thegioididong.com", h1_content: "H1 Content")
end

unless User.exists?(email: "super_teacher@gmail.com")
  User.create!(admin: true, email: "super_teacher@gmail.com", username: "super_teacher", password: "1234qwer", password_confirmation: "1234qwer",)
  User.create!(email: "student@gmail.com", username: "normal_teacher", password: "1234qwer", password_confirmation: "1234qwer",)
end

# Rails4InAction seed
unless User.exists?(email: "admin@ticketee.com")
  User.create!(email: "admin@ticketee.com", password: "password", admin: true)
end
unless User.exists?(email: "viewer@ticketee.com")
  User.create!(email: "viewer@ticketee.com", password: "password")
end
["Sublime Text 3", "Internet Explorer"].each do |name|
  unless Project.exists?(name: name)
    Project.create!(name: name, description: "A sample project about #{name}"
    )
  end
end
# End Rails4InAction seed

unless ::Test.exists?(name: "Ruby")
  ::Test.create!(name: "Ruby", description: "Foundation in Ruby")
end

unless ::Question.exists?(name: "OOP in Ruby")
  ruby = ::Test.where(name: "Ruby").first
  ::Question.create!(name: "OOP in Ruby", test_id: ruby.id)
  ::Question.create!(name: "Authenticate Gem", test_id: ruby.id)
end

unless ::Answer.exists?(name: "Everything are objects")
  ruby_oop = ::Question.where(name: "OOP in Ruby").first
  ruby_auth = ::Question.where(name: "Authenticate Gem").first
  ::Answer.create!(name: "Everything are objects", question_id: ruby_oop.id)
  ::Answer.create!(name: "String, Number, Hash are Object", question_id: ruby_oop.id)
  ::Answer.create!(name: "Just String", question_id: ruby_oop.id)

  ::Answer.create!(name: "Devise", question_id: ruby_auth.id)
  ::Answer.create!(name: "Devise Auth Token", question_id: ruby_auth.id)
  ::Answer.create!(name: "Devise Auth Token and Devise", question_id: ruby_auth.id)
  ::Answer.create!(name: "Active Model Serialization", question_id: ruby_auth.id)

end


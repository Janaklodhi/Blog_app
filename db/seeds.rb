# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
articles = [
  { title: "Introduction to Rails", body: "Rails is a web-application framework that includes everything needed to create database-backed web applications according to the Model-View-Controller (MVC) pattern." },
  { title: "Understanding Active Record", body: "Active Record is the M in MVC - the model - which is the layer of the system responsible for representing business data and logic." },
  { title: "Building RESTful APIs with Rails", body: "Rails makes it easy to build RESTful APIs. With just a few commands, you can have a fully functional API." },
  { title: "Getting Started with Ruby", body: "Ruby is a dynamic, open-source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write." },
  { title: "Best Practices in Rails Development", body: "Follow best practices like keeping controllers skinny, using partials, and leveraging Rails helpers to write clean, maintainable code." }
]

Article.create!(articles)
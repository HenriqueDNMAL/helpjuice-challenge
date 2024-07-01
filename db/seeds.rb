# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
100.times do
  # Randomly choose a search pattern
  pattern = rand(1..4)

  search_query = case pattern
                 when 1
                   "How to #{Faker::Verb.base} #{Faker::Commerce.product_name}"
                 when 2
                   "What is #{Faker::Commerce.department}"
                 when 3
                   "Where can I find #{Faker::Company.industry} near #{Faker::Address.city}"
                 when 4
                   "#{Faker::Educator.course_name} reviews"
                 end

  article = Article.create(title: search_query.titleize, content: Faker::Lorem.paragraph)
  puts "Created article: #{article.title}"
end

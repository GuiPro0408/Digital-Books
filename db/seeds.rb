# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
images_url = [
  "https://i.pinimg.com/originals/9e/4b/dd/9e4bdd7035a19228b660d7305bde7e98.jpg",
  "https://image.shutterstock.com/shutterstock/photos/1324444025/display_1500/stock-vector-open-book-vector-for-world-book-day-poster-flyer-and-social-media-post-1324444025.jpg",
  "https://alair.ala.org/bitstream/handle/11213/8704/Words%20Have%20Power-thumbnail_0.png?sequence=1&isAllowed=y",
  "https://www.loc.gov/static/programs/national-book-festival/images/posters/2021.jpg",
  "https://media.istockphoto.com/vectors/bright-retro-style-childrens-book-club-invitation-poster-vector-id535039943?s=170667a",
  "https://media.gettyimages.com/vectors/bright-retro-style-childrens-book-club-invitation-poster-vector-id535039939",
  "https://upload.wikimedia.org/wikipedia/en/6/67/UNESCO_World_Book_and_Copyright_Day_2012_poster.png"
]

Book.destroy_all

def content
  paragraph = []
  10.times do 
    content = Faker::Lorem.paragraph(sentence_count: 50)
    paragraph << content
  end

  return paragraph
end

10.times do
  Book.create(
    title: Faker::Book.title,
    overview: Faker::Lorem.paragraph(sentence_count: 5),
    author: Faker::Book.author,
    category: Faker::Book.genre,
    content: content(),
    poster_url: images_url.sample,
    price_per_day: rand(1..10)
  )
end
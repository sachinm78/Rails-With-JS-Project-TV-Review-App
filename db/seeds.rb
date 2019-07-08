# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Show.create(title: "Game of Thrones", genre: "Fantasy")
Show.create(title: "Big Little Lies", genre: "Drama")
Show.create(title: "Planet Earth", genre: "Documentary")
Show.create(title: "Lost", genre: "Sci-Fi")
Show.create(title: "The Office", genre: "Comedy")
Show.create(title: "American Horror Story", genre: "Horror")

Review.create(user_id: 1, show_id: 1, rating: 5, comment: "I love this show, but the final season felt rushed.")
Review.create(user_id: 1, show_id: 2, rating: 5, comment: "The cast is phenomenal!")
Review.create(user_id: 1, show_id: 3, rating: 5, comment: "Best nature show on TV!")
Review.create(user_id: 2, show_id: 4, rating: 3, comment: "It got boring after season 3.")
Review.create(user_id: 2, show_id: 5, rating: 4, comment: "I prefer the boss from the British version.")
Review.create(user_id: 2, show_id: 6, rating: 3, comment: "Couldn't get past season 1.")
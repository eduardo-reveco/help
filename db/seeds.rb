# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
# srequire 'json'
puts 'Deleting seeds'

# Booking.delete_all
Service.delete_all
User.delete_all

puts 'Creating new seeds'

# usuario

user_1 = User.create!(
  first_name: 'Pepo',
  last_name: 'Fritz',
  email: 'pepo@gmail.com',
  password: 123456,
)
user_1.save

# servicios

file = URI.open('https://images.unsplash.com/photo-1549617573-95569c1aac97?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=736&q=80')
service_1 = Service.create!(
  user: user_1,
  name: 'Diseño Web',
  description: 'Diseño web Pyme',
  price: 100,
)
service_1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
service_1.save


# file_2 = URI.open('https://unsplash.com/photos/gcsNOsPEXfs')
# service_2 = Service.create!(
#   user: user_1,
#   name: 'Grafica publicitaria',
#   description: 'Graficas de exteriores y bandeo vehiculos',
#   price: 4000,
# )
# service_2.photo.attach(io: file_2, filename: 'nes_2.jpg', content_type: 'image/jpg')
# service_2.save

# file_3 = URI.open('https://unsplash.com/photos/m_HRfLhgABo')
# service_3 = Service.create!(
#   user: user_1,
#   name: 'Testeo',
#   description: 'Ideas de emprendimiento',
#   price: 6700,
# )
# service_3.photo.attach(io: file_3, filename: 'nes_3.jpg', content_type: 'image/jpg')
# service_3.save
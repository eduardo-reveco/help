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
Booking.delete_all
Service.delete_all
User.delete_all

puts 'Creating new seeds'

# usuarios

file1 = URI.open('https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1789&q=80')
user_1 = User.create!(
  first_name: 'Pepo',
  last_name: 'Fritz',
  email: 'pepo@gmail.com',
  password: 123456,
)
user_1.photo.attach(io: file1, filename: 'user1_seed.png', content_type: 'image/png')
user_1.save


file2 = URI.open('https://images.unsplash.com/photo-1573140247632-f8fd74997d5c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1500&q=80')
user_2 = User.create!(
  first_name: 'Matilda',
  last_name: 'Konk',
  email: 'maty@gmail.com',
  password: 123456,
)
user_2.photo.attach(io: file2, filename: 'user2_seed.png', content_type: 'image/png')
user_2.save


# servicios

file3 = URI.open('https://images.unsplash.com/photo-1549617573-95569c1aac97?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=736&q=80')
service_1 = Service.create!(
  user: user_1,
  name: 'Diseño Web',
  description: 'Diseño web Pyme',
  price: 100,
)
service_1.photo.attach(io: file3, filename: 'nes_1.png', content_type: 'image/png')
service_1.save


file_4 = URI.open('https://images.unsplash.com/photo-1593642634367-d91a135587b5?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80')
service_2 = Service.create!(
  user: user_1,
  name: 'Grafica publicitaria',
  description: 'Graficas de exteriores y bandeo vehiculos',
  price: 4000,
)
service_2.photo.attach(io: file_4, filename: 'nes_2.jpg', content_type: 'image/jpg')
service_2.save




file_5 = URI.open('https://images.unsplash.com/photo-1631201551766-32e90f6c233c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80')
service_3 = Service.create!(
  user: user_2,
  name: 'Testeo',
  description: 'Ideas de emprendimiento',
  price: 6700,
)
service_3.photo.attach(io: file_5, filename: 'nes_3.jpg', content_type: 'image/jpg')
service_3.save

# booking

booking_1 = Booking.create!(
  user: user_2,
  service: service_1
)

booking_2 = Booking.create!(
  user: user_1,
  service: service_3
)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'
puts 'Deleting seeds'
Service.delete_all
puts 'Creating new seeds'
file_1 = URI.open('https://unsplash.com/photos/bs2Ba7t69mM')
service_1 = Service.create!(
  name: 'Diseño Web',
  description: 'Diseño web Pyme',
  price: 100,
)
service_1.photo.attach(io: file_1, filename: 'nes_1.jpg', content_type: 'image/jpg')
service_1.save

file_2 = URI.open('https://unsplash.com/photos/gcsNOsPEXfs')
service_2 = Service.create!(
  name: 'Grafica publicitaria',
  description: 'Graficas de exteriores y bandeo vehiculos',
  price: 4000,
)
service_2.photo.attach(io: file_2, filename: 'nes_2.jpg', content_type: 'image/jpg')
service_2.save

file_3 = URI.open('https://unsplash.com/photos/m_HRfLhgABo')
service_3 = Service.create!(
  name: 'Testeo',
  description: 'Ideas de emprendimiento',
  price: 6700,
)
service_3.photo.attach(io: file_3, filename: 'nes_3.jpg', content_type: 'image/jpg')
service_3.save
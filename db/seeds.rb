# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
johng = Author.create(first_name: 'John', last_name: 'Grisham')
musso = Author.create(first_name: 'Guillaume', last_name: 'Musso')

wynwood = Publisher.create(name: 'Wynwood Press')
penguin = Publisher.create(name: 'Penguin Press')

timetokill = wynwood.books.create(title: 'A Time To Kill', genre: 'Thriller', language: 'english') 
timetokill.collaborations.create(author_id: johng.id, role: 'writer')

perhaps = penguin.books.create(title: 'One Day, Perhaps', genre: 'romance', language: 'french') 
perhaps.collaborations.create(author_id: johng.id, role: 'editor')
perhaps.collaborations.create(author_id: musso.id, role: 'writer')

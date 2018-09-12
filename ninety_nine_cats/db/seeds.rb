# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all
CatRentalRequest.destroy_all


cat1 = Cat.create(name: "Muffin", birth_date: '2010/1/1', color: "orange", sex: "M", description: "A cat")
cat2 = Cat.create(name: "Bread", birth_date: '2011/1/20', color: "black", sex:"F", description: "A cat")
cat3 = Cat.create(name: "Cinnamon Roll", birth_date: '2012/3/4', color: "white", sex: "M", description: "A cat")
cat4 = Cat.create(name: "Bagel", birth_date: '2013/5/10', color: "striped", sex: "F", description: "A cat")
cat5 = Cat.create(name: "Croissant", birth_date: '2014/1/1', color: "grey", sex: "M", description: "A cat")


request1 = CatRentalRequest.create(cat_id: cat1.id, start_date: '2018/10/10', end_date: '2018/10/18', status: 'APPROVED')
request2 = CatRentalRequest.create(cat_id: cat2.id, start_date: '2018/10/10', end_date: '2018/10/18', status: 'PENDING')
request3 = CatRentalRequest.create(cat_id: cat3.id, start_date: '2018/10/10', end_date: '2018/10/18', status: 'APPROVED')
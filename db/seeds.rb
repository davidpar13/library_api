# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
members = Member.create([{ name: "David", card_number: "123-1234-1234", expiration_date: "12/24", cvv: "123"},
                         {name: "Brad", card_number: "123-1234-1234", expiration_date: "12/24", cvv: "123"}])
p "Created #{Member.count} Members"

libraries = Library.create([{name:"Zhul"}, {name:"Clardy"}])
p "Created #{Library.count} Libraries"

Book.create([{isbn: "111", title: "Book1", author: "Author1", checked_out: false, return_by: nil, availability: "Available", library_id: libraries.first.id},
             {isbn: "111", title: "Book1", author: "Author1", checked_out: false, return_by: nil, availability: "Available", library_id: libraries.first.id},
             {isbn: "222", title: "Book2", author: "Author2", checked_out: false, return_by: nil, availability: "Available", library_id: libraries.first.id},
             {isbn: "111", title: "Book1", author: "Author1", checked_out: false, return_by: nil, availability: "Available", library_id: libraries.last.id},
             {isbn: "111", title: "Book1", author: "Author1", checked_out: false, return_by: nil, availability: "Available", library_id: libraries.last.id},
             {isbn: "222", title: "Book2", author: "Author2", checked_out: false, return_by: nil, availability: "Available", library_id: libraries.last.id}])
p "Created #{Book.count} Books"

Membership.create([{member_id: members.first.id, library_id: libraries.first.id},
                   {member_id: members.first.id, library_id: libraries.last.id},
                   {member_id: members.last.id, library_id: libraries.first.id}])
p "Created #{Membership.count} Memberships"
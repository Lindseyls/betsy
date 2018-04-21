# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

product_file = Rails.root.join('db', 'product_seeds.csv')

# might have to change to .open, and
CSV.foreach(product_file, headers: true, header_converters: :symbol, converters: :all) do |row|
  # data is in a Hash, create a product ising the row data?
  data = Hash[row.headers.zip(row.fields)]
  puts data
  Product.create!(data)
  # we never do anything with the new data structure
end


user_file = Rails.root.join('db', 'user_seeds.csv')

# might have to change to .open, and
CSV.foreach(user_file, headers: true, header_converters: :symbol, converters: :all) do |row|
  # data is in a Hash, create a product ising the row data?
  data = Hash[row.headers.zip(row.fields)]
  puts data
  User.create!(data)
  # we never do anything with the new data structure
end

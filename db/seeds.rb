# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
require 'csv'

CSV.foreach('../rails/japanese-csv.csv', headers: true) do |row|
# shop
  shop = Shop.new(:shop_no => row[8],:shop_name => row[9])
  if Shop.all.include?(shop) == false
    shop.save
  else
  end
#location, publisher, genre
  @shop = Shop.find_by_shop_no(row[8])
  location = Location.new(:location_name => row[0], :shop_id => @shop.id)
  if Location.all.include?(location) == false
  location.save
  else
  end

  genre = Genre.new(:genre_name => row[1], :shop_id => @shop.id)
  if Genre.all.include?(genre) == false
  genre.save
  else
  end

  publisher = Publisher.new(:publisher_name => row[5], :shop_id => @shop.id)
  if Publisher.all.include?(publisher) == false
  publisher.save
  else
  end

 # Book
  @location = Location.find_by_location_name_and_shop_id(row[0],@shop.id)
  @publisher = Publisher.find_by_publisher_name_and_shop_id(row[5],@shop.id)
  @genre = Genre.find_by_genre_name_and_shop_id(row[1],@shop.id)
  if @genre == nil
    @gen = nil
  else
    @gen = @genre.id
  end
  book = Book.create!(:book_name => row[3], :location_id => @location.id,
  :publisher_id => @publisher.id, :shop_id => @shop.id, :genre_id => @gen,
  :jan =>row[2] ,:author => row[4], :publish_date => row[6], :price => row[7],:final_purchase => row[10],
  :final_sale => row[11], :sale_number => row[12], :inventory_number => row[13], :nation_sale => row[14])

end

user = User.create(:user_id => '1992111-1234', :password=> 'sa1234',
:name => 'quangdung', :uid=> '0000000000002',
:shop_no => '2406')

if user.errors.blank?
  puts "***User #{user.name} #{user.password} created ***"
else
  puts "user failed to create due to below reasons:"
  user.errors.each do |x, y|
    puts"***#{x} #{y}***" # x will be the field name and y will be the error on it
  end
end

user = User.login("1992112-1234","112113")
if user
  puts "***User #{user.user_id} #{user.password} logged in ***"
else
  puts "***User does not exist! ***"
end

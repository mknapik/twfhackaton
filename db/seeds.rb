# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'

GameType.where(id: 1, name: 'podzbiór').first_or_create! do |type|
  type.description = 'Wybieranie podzbioru obrazków wg tematu'
end

GameType.where(id: 2, name: 'sekwencja').first_or_create! do |type|
  type.description = 'Wybieranie podzbioru obrazków wg tematu'
end

GameType.where(id: 3, name: 'klasyfikacja').first_or_create! do |type|
  type.description = 'Dopasowanie obrazków w grupy'
end

game = Game.where(name: 'Śniadanie', game_type_id: 1).first_or_create! do |game|
  game.description = 'Wybierz produkty na śniadanie'
end

bread = Tile.where(name: 'chleb').first_or_create! do |tile|
  tile.image = open('http://lorempixel.com/200/200/food/10/')
end
b = Tile.where(name: 'bułka').first_or_create! do |tile|
  tile.image = open('http://lorempixel.com/200/200/food/7/')
end
cheese = Tile.where(name: 'ser').first_or_create! do |tile|
  tile.image = open('http://lorempixel.com/200/200/food/3/')
end
yogurt = Tile.where(name: 'jogurt').first_or_create! do |tile|
  tile.image = open('http://lorempixel.com/200/200/food/')
end

TileSet.where(name: 'Nabiał', game: Game.find_by!(name: 'Śniadanie')).first_or_create! do |set|
  set.tiles << [Tile.find_by!(name: 'ser'), Tile.find_by!(name: 'jogurt')]
  set.image = open('http://lorempixel.com/200/200/food/')
end

TileSet.where(name: 'Pieczywo', game: Game.find_by!(name: 'Śniadanie')).first_or_create! do |set|
  set.tiles << [Tile.find_by!(name: 'bułka'), Tile.find_by!(name: 'chleb')]
  set.image = open('http://lorempixel.com/200/200/food/')
end

Solution.where(tile_id: bread.id, game_id: game.id).first_or_create! do |s|
  s.set = 1
end

Solution.where(tile_id: cheese.id, game_id: game.id).first_or_create! do |s|
  s.set = 2
end

Solution.where(tile_id: b.id, game_id: game.id).first_or_create! do |s|
  s.set = 2
end

Solution.where(tile_id: yogurt.id, game_id: game.id).first_or_create!
#
# if Dir.exists?(Rails.root.join('tmp/education'))
#
#   tiles = Dir.glob('tmp/education/*').map do |file_name|
#     puts file_name
#     name = file_name.sub('tmp/education', '').gsub('.svg', '')
#     Tile.where(name: name).first_or_create! do |tile|
#       tile.image = open(file_name)
#     end
#   end
#
#   (1..10).each do |i|
#     education = Game.where(name: "Edukacja #{i}", game_type_id: 2).first_or_create! do |game|
#       game.description = ''
#     end
#
#     sample = tiles.sample(50)
#
#     TileSet.where(name: 'Edukacja', game: Game.find_by!(name: "Edukacja #{i}")).first_or_create! do |set|
#       set.tiles << sample
#       set.image = open('tmp/education/education.png')
#     end
#
#     sample.take(20).each do |tile|
#       Solution.where(tile_id: tile.id, game_id: education.id).first_or_create!
#     end
#   end
# end

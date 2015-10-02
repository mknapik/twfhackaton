# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'

def initialize_game_types
  GameType.where(id: 1, name: 'podzbiór').first_or_create! do |type|
    type.description = 'Wybieranie podzbioru obrazków wg tematu'
  end

  GameType.where(id: 2, name: 'sekwencja').first_or_create! do |type|
    type.description = 'Wybieranie podzbioru obrazków wg tematu'
  end

  GameType.where(id: 3, name: 'klasyfikacja').first_or_create! do |type|
    type.description = 'Dopasowanie obrazków w grupy'
  end
end


def create_tile(name, image)
  Tile.where(name: name).first_or_create! do |tile|
    tile.image = open("images/#{image}")
  end
end

def create_subset_game(name, description)
  Game.where(name: name, game_type_id: 1).first_or_create! do |game|
    game.description = description
  end
end

def create_category(name, game, tiles)
  TileSet.where(name: name, game: game).first_or_create! do |set|
    set.tiles << tiles
    set.image = open('http://lorempixel.com/200/200/food/')
  end
end

def create_solution(tile, game, set)
  Solution.where(tile_id: tile.id, game_id: game.id).first_or_create! do |s|
    s.set = set
  end
end

initialize_game_types

# TWorzenie gry śniadanie
sniadanie = create_subset_game('Śniadanie', 'Wybierz produkty na śniadanie')

## Dodawanie obrazkow
chleb = create_tile('chleb', 'chleb.png')
bulka = create_tile('bulka', 'bulka.png')
jogurt = create_tile('jogurt', 'jogurt.png')
ser = create_tile('ser', 'ser.png')

## Tworzenie kategorii
nabial = create_category('Nabiał', sniadanie, [bulka, jogurt])
pieczywo = create_category('Pieczywo', sniadanie, [chleb, ser])

## Tworzenie poprawnych odpowiedzi

create_solution(chleb, sniadanie, 1)
create_solution(ser, sniadanie, 2)
create_solution(bulka, sniadanie, 2)
create_solution(jogurt, sniadanie, 1)

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

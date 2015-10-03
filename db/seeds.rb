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


def dodaj_obrazek(name, image)
  Tile.where(name: name).first_or_create! do |tile|
    tile.image = open("images/#{image}")
  end
end

def stworz_gre_typu_podzbior(name, description)
  Game.where(name: name, game_type_id: 1).first_or_create! do |game|
    game.description = description
  end
end

def dodaj_kategorie_dla_gry(game, name, tiles)
  TileSet.where(name: name, game: game).first_or_create! do |set|
    set.tiles << tiles
    set.image = open('http://lorempixel.com/200/200/food/')
  end
end

def ustaw_odpowiedz_dla_gry(game, tile)
  Solution.where(tile_id: tile.id, game_id: game.id).first_or_create!
end

class Gra

  def self.stworz(name, description)
    Gra.new(name, description)
  end

  def initialize(name , description)
    @gra = stworz_gre_typu_podzbior(name, description)
  end

  def ma_poprawna_odpowiedz(tile)
    ustaw_odpowiedz_dla_gry(@gra, tile)
  end

  def dodaj_kategorie(name, tiles)
    dodaj_kategorie_dla_gry(@gra, name, tiles)
  end
end

initialize_game_types

# TWorzenie gry śniadanie
sniadanie = Gra.stworz('Śniadanie', 'Wybierz produkty na śniadanie')

## Dodawanie obrazkow
chleb = dodaj_obrazek('chleb', 'chleb.png')
bulka = dodaj_obrazek('bulka', 'bulka.png')
jogurt = dodaj_obrazek('jogurt', 'jogurt.png')
ser = dodaj_obrazek('ser', 'ser.png')

## Tworzenie kategorii
sniadanie.dodaj_kategorie('Nabiał', [bulka, jogurt])
sniadanie.dodaj_kategorie('Pieczywo' , [chleb, ser])

## Tworzenie poprawnych odpowiedzi
sniadanie.ma_poprawna_odpowiedz(chleb)
sniadanie.ma_poprawna_odpowiedz(ser)


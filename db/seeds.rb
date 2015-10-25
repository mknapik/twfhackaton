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

def stworz_gre_typu_podzbior(name, description, image)
  Game.where(name: name, game_type_id: 1).first_or_create! do |game|
    game.description = description
    game.image = open("images/#{image}")
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

  def self.stworz(name, description, image)
    Gra.new(name, description, image)
  end

  def initialize(name , description, image)
    @gra = stworz_gre_typu_podzbior(name, description, image)
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
sniadanie = Gra.stworz('Śniadanie', 'Wybierz rzeczy i produkty związane ze śniadaniem?', 'breakfast/breakfast.jpg')

## Dodawanie obrazkow
avocado = dodaj_obrazek('avocado', '/breakfast/avocado.png')
banan = dodaj_obrazek('banan', '/breakfast/banan.png')
fasola = dodaj_obrazek('fasola', '/breakfast/bin.png')
chleb = dodaj_obrazek('chleb', '/breakfast/bread.png')
ser = dodaj_obrazek('ser', '/breakfast/cheese.png')
wisnie = dodaj_obrazek('wisnie', '/breakfast/cherry.png')
kurczak = dodaj_obrazek('kurczak', '/breakfast/chicken.png')
jajko = dodaj_obrazek('jajko', '/breakfast/egg.png')
owoce = dodaj_obrazek('owoce', '/breakfast/fruits.png')
winogrono = dodaj_obrazek('winogrono', '/breakfast/grape.png')
kukurydza = dodaj_obrazek('kukurydza', '/breakfast/corn.png')
pomarancza = dodaj_obrazek('pomarancza', '/breakfast/orange.png')
pizza = dodaj_obrazek('pizza', '/breakfast/pizza.png')
tost = dodaj_obrazek('tost', '/breakfast/tost.png')

szampan = dodaj_obrazek('szampan', '/breakfast/champagne.png')
kawa = dodaj_obrazek('kawa', '/breakfast/coffee.png')
wino = dodaj_obrazek('wino', '/breakfast/wine.png')
cola = dodaj_obrazek('cola', '/breakfast/cola.png')
lemoniada = dodaj_obrazek('lemoniada', '/breakfast/lemoniade.png')
piwo = dodaj_obrazek('piwo', '/breakfast/beer.png')

rekawica = dodaj_obrazek('rekawica', '/breakfast/glove.png')
kielich = dodaj_obrazek('kielich', '/breakfast/goblet.png')
grill = dodaj_obrazek('grill', '/breakfast/grill.png')
noz = dodaj_obrazek('noz', '/breakfast/knife.png')
chochla = dodaj_obrazek('chochla', '/breakfast/ladle.png')
mikrofala = dodaj_obrazek('mikrofala', '/breakfast/microwave.png')
maszynka = dodaj_obrazek('maszynka', '/breakfast/mincer.png')
mikser = dodaj_obrazek('mikser', '/breakfast/mixer.png')
przeciskacz = dodaj_obrazek('przeciskacz', '/breakfast/potatoricer.png')
walek = dodaj_obrazek('walek', '/breakfast/roller.png')
sito = dodaj_obrazek('sito', '/breakfast/strainer1.png')
toster = dodaj_obrazek('toster', '/breakfast/toaster.png')
waga = dodaj_obrazek('waga', '/breakfast/weight.png')
otwieracz = dodaj_obrazek('otwieracz', '/breakfast/wineopener.png')

## Tworzenie kategorii
sniadanie.dodaj_kategorie('Żywność', [avocado, banan, fasola, chleb, ser, wisnie, kurczak, jajko, owoce, winogrono, kukurydza, pomarancza, pizza, tost])
sniadanie.dodaj_kategorie('Napoje' , [kawa, wino, piwo, lemoniada, cola, szampan])
sniadanie.dodaj_kategorie('Przedmioty' , [rekawica, kielich, grill, noz, chochla, mikrofala, maszynka, mikser, przeciskacz, walek, sito, toster, waga, otwieracz])

## Tworzenie poprawnych odpowiedzi
sniadanie.ma_poprawna_odpowiedz(chleb)
sniadanie.ma_poprawna_odpowiedz(ser)
sniadanie.ma_poprawna_odpowiedz(jajko)
sniadanie.ma_poprawna_odpowiedz(tost)
sniadanie.ma_poprawna_odpowiedz(kawa)
sniadanie.ma_poprawna_odpowiedz(noz)
sniadanie.ma_poprawna_odpowiedz(toster)


# Tworzenie gry wycieczka w góry
gory = Gra.stworz('Wycieczka w góry', 'Co należy zabrać na wycieczkę w góry?', '/mountains/mountains.jpeg')

## Dodawanie obrazkow
buty = dodaj_obrazek('buty','/mountains/shoes.png')
sweter = dodaj_obrazek('sweter','/mountains/jacket.png')
plecak = dodaj_obrazek('plecak', '/mountains/bag.png')
pilka = dodaj_obrazek('pilka', '/mountains/ball.png')
komputer = dodaj_obrazek('komputer','/mountains/computer.png')
japonki = dodaj_obrazek('japonki','/mountains/flip-flops.png')
szpilki = dodaj_obrazek('szpilki','/mountains/high-heel.png')
telefon = dodaj_obrazek('telefon','/mountains/phone.png')
krawat = dodaj_obrazek('krawat','/mountains/tie.png')
latarka = dodaj_obrazek('latarka','/mountains/torch.png')
sukienka = dodaj_obrazek('sukienka','/mountains/dress.png')

gory.dodaj_kategorie('Odzież i obuwie' , [buty, sweter, japonki, szpilki, krawat])
gory.dodaj_kategorie('Przedmioty' , [plecak, pilka, komputer, telefon,latarka])
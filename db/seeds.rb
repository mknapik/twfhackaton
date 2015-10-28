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
sniadanie = Gra.stworz('Śniadanie', 'Wybierz rzeczy i produkty związane ze śniadaniem?', 'breakfast/spoon.png')

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
gory = Gra.stworz('Wycieczka w góry', 'Co należy zabrać na wycieczkę w góry?', '/mountains/mountains.png')

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
tost = dodaj_obrazek('tost', '/breakfast/tost.png')
mikser = dodaj_obrazek('mikser', '/breakfast/mixer.png')
wino = dodaj_obrazek('wino', '/breakfast/wine.png')
rekawica = dodaj_obrazek('rekawica', '/breakfast/glove.png')
waga = dodaj_obrazek('waga', '/breakfast/weight.png')
otwieracz = dodaj_obrazek('otwieracz', '/breakfast/wineopener.png')
fasola = dodaj_obrazek('fasola', '/breakfast/bin.png')
chleb = dodaj_obrazek('chleb', '/breakfast/bread.png')
kurczak = dodaj_obrazek('kurczak', '/breakfast/chicken.png')
winogrono = dodaj_obrazek('winogrono', '/breakfast/grape.png')
kukurydza = dodaj_obrazek('kukurydza', '/breakfast/corn.png')
pizza = dodaj_obrazek('pizza', '/breakfast/pizza.png')
torebka = dodaj_obrazek('torebka', '/mountains/womanbag.png')
ryba = dodaj_obrazek('ryba', '/mountains/fish.png')
lornetka = dodaj_obrazek('lornetka', '/mountains/binoculars.png')
spodnie = dodaj_obrazek('spodnie', '/mountains/trousers.png')
banan = dodaj_obrazek('banan', '/breakfast/banan.png')

gory.dodaj_kategorie('Odzież i obuwie' , [buty, sweter, japonki, szpilki, krawat, sukienka,spodnie])
gory.dodaj_kategorie('Przedmioty' , [plecak, pilka, komputer, telefon,latarka,mikser,rekawica,waga,otwieracz,torebka,lornetka])
gory.dodaj_kategorie('Żywność' , [tost,wino,fasola,kurczak,winogrono,kukurydza,pizza,ryba,banan])

gory.ma_poprawna_odpowiedz(buty)
gory.ma_poprawna_odpowiedz(sweter)
gory.ma_poprawna_odpowiedz(spodnie)
gory.ma_poprawna_odpowiedz(plecak)
gory.ma_poprawna_odpowiedz(latarka)
gory.ma_poprawna_odpowiedz(tost)
gory.ma_poprawna_odpowiedz(banan)

zwierzeta = Gra.stworz('Zwierzęta', 'Wybierz zwięrzęta hodowlane', '/animals/print.png')

## Dodawanie obrazkow
kaczka = dodaj_obrazek('kaczka','/animals/duck.png')
zaba = dodaj_obrazek('zaba','/animals/frog.png')
kon = dodaj_obrazek('kon','/animals/horses.png')
swinia = dodaj_obrazek('swinia','/animals/pig.png')
krolik = dodaj_obrazek('krolik','/animals/rabbit.png')
waz = dodaj_obrazek('waz','/animals/snake.png')
gwiazda = dodaj_obrazek('gwiazda','/animals/star.png')
zolw = dodaj_obrazek('zolw','/animals/turtle.png')
wieloryb = dodaj_obrazek('wieloryb','/animals/whale.png')
robak = dodaj_obrazek('robak','/animals/worms.png')
sowa = dodaj_obrazek('sowa','/animals/owl.png')
kura = dodaj_obrazek('kura','/animals/chicken.png')
krowa = dodaj_obrazek('krowa','/animals/cow.png')
slimak = dodaj_obrazek('slimak','/animals/snail.png')
pajak = dodaj_obrazek('pajak','/animals/spiders.png')
indyk = dodaj_obrazek('indyk','/animals/turkey.png')

zwierzeta.dodaj_kategorie('Zwierzęta' , [kaczka, zaba, kon, swinia, krolik, waz, gwiazda, zolw, wieloryb, robak, sowa, kura, krowa, slimak, pajak,indyk])

zwierzeta.ma_poprawna_odpowiedz(kaczka)
zwierzeta.ma_poprawna_odpowiedz(kon)
zwierzeta.ma_poprawna_odpowiedz(swinia)
zwierzeta.ma_poprawna_odpowiedz(krolik)
zwierzeta.ma_poprawna_odpowiedz(kura)
zwierzeta.ma_poprawna_odpowiedz(krowa)
zwierzeta.ma_poprawna_odpowiedz(indyk)

zima = Gra.stworz('Pory Roku - Zima', 'Wybierz wszystkie rzeczy, które związane są z zimą', '/seasons/snowflake.png')
lato = Gra.stworz('Pory Roku - Lato', 'Wybierz wszystkie rzeczy, które związane są z latem', '/seasons/sun.png')

## Dodawanie obrazkow
karawan = dodaj_obrazek('karawan','/seasons/car.png')
deska = dodaj_obrazek('deska','/seasons/lifeguard.png')
rekawiczki = dodaj_obrazek('rękawiczki','/seasons/glove.png')
lody = dodaj_obrazek('lody','/seasons/icecream.png')
lyzwy = dodaj_obrazek('łyżwy','/seasons/iceskate.png')
japonki = dodaj_obrazek('japonki','/seasons/sandals.png')
narty = dodaj_obrazek('narty','/seasons/ski.png')
nartybiegowe = dodaj_obrazek('narty biegowe','/seasons/skirun.png')
koszulka = dodaj_obrazek('koszulka','/seasons/t-shirt.png')
czapka = dodaj_obrazek('czapka','/seasons/beanie.png')
sanki = dodaj_obrazek('sanki','/seasons/sled.png')
kurtkazimowa = dodaj_obrazek('kurtka zimowa','/seasons/winterclothes.png')
slonce = dodaj_obrazek('słońce','/seasons/sun.png')
plywanie = dodaj_obrazek('pływanie','/seasons/swimming.png')
zaglowanie = dodaj_obrazek('żeglowanie','/seasons/ship.png')
surfowanie = dodaj_obrazek('surfowanie','/seasons/surfboard.png')
palma = dodaj_obrazek('palma','/seasons/palm.png')
spodenki = dodaj_obrazek('spodenki','/seasons/bermuda.png')
rower = dodaj_obrazek('rower','/seasons/bicycle.png')

zima.dodaj_kategorie('Sport', [lyzwy,narty,nartybiegowe,plywanie,surfowanie,zaglowanie,rower])
zima.dodaj_kategorie('Odzież i obuwie', [rekawiczki,japonki,koszulka,czapka,kurtkazimowa,spodenki,sukienka])
zima.dodaj_kategorie('Inne', [karawan,deska,lody,sanki,slonce,palma])

zima.ma_poprawna_odpowiedz(lyzwy)
zima.ma_poprawna_odpowiedz(narty)
zima.ma_poprawna_odpowiedz(nartybiegowe)
zima.ma_poprawna_odpowiedz(rekawiczki)
zima.ma_poprawna_odpowiedz(czapka)
zima.ma_poprawna_odpowiedz(sanki)
zima.ma_poprawna_odpowiedz(kurtkazimowa)

lato.dodaj_kategorie('Sport', [lyzwy,surfowanie,narty,plywanie,nartybiegowe,rower])
lato.dodaj_kategorie('Odzież i obuwie', [rekawiczki,japonki,czapka,kurtkazimowa,spodenki])
lato.dodaj_kategorie('Inne', [lody,sanki,palma])

lato.ma_poprawna_odpowiedz(plywanie)
lato.ma_poprawna_odpowiedz(surfowanie)
lato.ma_poprawna_odpowiedz(rower)
lato.ma_poprawna_odpowiedz(spodenki)
lato.ma_poprawna_odpowiedz(japonki)
lato.ma_poprawna_odpowiedz(lody)
lato.ma_poprawna_odpowiedz(palma)


plywanie = Gra.stworz('Basen', 'Co należy zabrać na basen?', '/seasons/swimming.png')

czepek = dodaj_obrazek('czepek','/swimming/swim.png')
suszarka = dodaj_obrazek('suszarka','/swimming/hairdryer.png')
klapki = dodaj_obrazek('klapki','/swimming/sandals.png')
strojkapielowy = dodaj_obrazek('strojkapielowy','/swimming/swimsuit.png')
kapielowki = dodaj_obrazek('kąpielówki','/swimming/swimmer.png')
szampon = dodaj_obrazek('szampon','/swimming/shampoo.png')
pletwy = dodaj_obrazek('płetwy','/swimming/dive.png')

plywanie.dodaj_kategorie('Przedmioty',[czepek,rower,koszulka,lyzwy,suszarka,lornetka,klapki,buty,telefon,strojkapielowy,latarka,płetwy,komputer,szampon,szpilki,krawat,noz,lyzwy,koszulka,otwieracz])

plywanie.ma_poprawna_odpowiedz(czepek)
plywanie.ma_poprawna_odpowiedz(suszarka)
plywanie.ma_poprawna_odpowiedz(strojkapielowy)
plywanie.ma_poprawna_odpowiedz(płetwy)
plywanie.ma_poprawna_odpowiedz(szampon)
plywanie.ma_poprawna_odpowiedz(kapielowki)
plywanie.ma_poprawna_odpowiedz(klapki)

namespace :example_data do
  task :prepare => :environment do
    if Dir.exists?(Rails.root.join('example_sets/mountains'))
      mapping = {
        'klapki' => 'beach38',
        'telefon' => 'cellphone87',
        'plecak' => 'book_bag1',
        'bluza' => 'clothing177',
        'komputer' => 'computer209',
        'kanapka' => 'sandwich',
        'buty' => 'shoes',
        'pilka' => 'soccer19',
        'szpilki' => 'stylish2',
        'krawat' => 'tie10'
      }

      tiles = mapping.map do |name, file_name|
        Tile.where(name: name).first_or_create! do |tile|
          tile.image = open(Rails.root.join('example_sets/mountains', "#{file_name}.png"))
        end
      end

      trip = Game.where(id: 777, name: "Wycieczka w góry", game_type_id: 1).first_or_create! do |game|
        game.description = 'Co powinieneś zabrać na wycieczkę w góry?'
      end

      TileSet.where(name: 'Przedmioty', game: trip).first_or_create! do |set|
        set.tiles << tiles
        set.image = open('tmp/education/education.png')
      end

      Solution.where(tile: Tile.find_by!(name: 'telefon').id, game_id: trip.id).first_or_create!
      Solution.where(tile: Tile.find_by!(name: 'plecak').id, game_id: trip.id).first_or_create!
      Solution.where(tile: Tile.find_by!(name: 'bluza').id, game_id: trip.id).first_or_create!
      Solution.where(tile: Tile.find_by!(name: 'kanapka').id, game_id: trip.id).first_or_create!
      Solution.where(tile: Tile.find_by!(name: 'buty').id, game_id: trip.id).first_or_create!
    end
  end
end

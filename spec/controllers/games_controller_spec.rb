require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe 'GET show' do
    let(:game) { create(:game) }
    let(:expected_response) do
      {
        'id' => game.id, 'name' => game.name, 'description' => game.description, 'tile_sets' => game.tile_sets
      }
    end

    subject { get :show, id: game.id }

    before { subject }

    it 'returns ok' do
      expect(response).to be_ok
    end

    it 'returns serialized game' do
      expect(JSON.parse(response.body)).to eq(expected_response)
    end
  end

  describe 'GET preview' do
    let(:game) { create(:game) }
    let(:expected_response) do
      {
        'id' => game.id, 'name' => game.name, 'description' => game.description
      }
    end

    subject { get :preview, game_id: game.id }

    before { subject }

    it 'returns ok' do
      expect(response).to be_ok
    end

    it 'returns serialized game' do
      expect(JSON.parse(response.body)).to eq(expected_response)
    end
  end
end

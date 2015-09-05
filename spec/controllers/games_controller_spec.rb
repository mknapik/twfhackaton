require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe 'GET show' do
    let(:game) { create(:game) }
    let(:expected_response) do
      {
        'id' => game.id, 'name' => game.name, 'description' => game.description, 'tile_sets' => [],
        'no_solutions' => 0
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
  #
  # describe 'POST solution' do
  #   let!(:solutions) { [build(:solution).save!, build(:solution).save!] }
  #   let(:game) { create(:game) }
  #   let(:solution) { {'tiles' => [1, 2, 3]} }
  #
  #   subject { post :solution, game_id: game.id, solution: solution }
  #
  #   before { subject }
  #
  #   context 'when solution is perfect' do
  #     it 'returns ok' do
  #       expect(response).to be_ok
  #     end
  #
  #     it 'returns ok' do
  #       expect(JSON.parse(response.body)).to eq(expected_response)
  #     end
  #   end
  # end
end

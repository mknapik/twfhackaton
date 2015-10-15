require 'rails_helper'

RSpec.describe Game, type: :model do
  describe '#check_solution' do
    let(:game) { create(:game, game_type: game_type) }
    let(:tile_set) { create(:tile_set, game_id: game.id) }
    let(:tile_ids) { [1, 2, 3] }
    let(:tiles) { tile_ids.map { |tid| create(:tile, id: tid) } }
    let!(:solutions) { tiles.map { |tile| create(:solution, game_id: game.id, tile_id: tile.id) } }


    before do
      tile_set.tiles << tiles
    end

    subject { game.check_solution(solution_tile_ids) }

    shared_examples_for 'hit or miss' do
      context 'when contains all tiles' do
        let(:solution_tile_ids) { [1, 2, 3] }

        it 'has maximum rating' do
          expect(subject).to eq(Game::RATINGS.last)
        end
      end

      context 'when contains no tiles' do
        let(:solution_tile_ids) { [] }

        it 'has maximum rating' do
          expect(subject).to eq(Game::RATINGS.first)
        end
      end

      context 'when contains invalid tiles' do
        let(:solution_tile_ids) { [11, 12, 13] }

        it 'has maximum rating' do
          expect(subject).to eq(Game::RATINGS.first)
        end
      end
    end

    context 'when sequence' do
      let(:game_type) { create(:game_type, :sequence) }

      it_behaves_like 'hit or miss'

      context 'when contains all tiles' do
        context 'when order is reversed' do
          let(:solution_tile_ids) { [3, 2, 1] }

          it 'has maximum rating' do
            expect(subject < 5).to be_truthy
          end
        end

        context 'when order is not correct' do
          let(:solution_tile_ids) { [1, 3, 2] }

          it 'has some rating in the middle' do
            expect(subject > 1).to be_truthy
            expect(subject < 5).to be_truthy
          end
        end
      end
    end

    context 'when subset' do
      let(:game_type) { create(:game_type, :subset) }

      it_behaves_like 'hit or miss'
    end
  end
end

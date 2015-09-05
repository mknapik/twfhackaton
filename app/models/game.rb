class Game < ActiveRecord::Base
  belongs_to :game_type
  has_many :solutions
  has_many :tile_sets
  has_many :tiles, through: :solutions

  validates :name, :game_type, presence: true

  RATINGS = (1..5)

  def no_solutions
    solutions.pluck(:set).uniq.count
  end

  def solution_sets
    solutions.includes(:tile).group_by(&:set).map do |set, solutions|
      solutions.map(&:tile)
    end
  end

  def check_solution(solution_tile_ids)
    tile_ids = tiles.pluck(:id)
    max = tile_ids.count

    missing = (tile_ids - solution_tile_ids).size
    redundant = (solution_tile_ids - tile_ids).size

    RATINGS.take(calculate_rating(max, missing, redundant)).last
  end

  def calculate_rating(max, missing, redundant)
    [(correctness(max, missing, redundant) * RATINGS.size).ceil, 1].max
  end

  def correctness(max, missing, redundant)
    (max - missing - redundant) * 1.0 / max
  end
end

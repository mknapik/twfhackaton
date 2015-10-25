class Game < ActiveRecord::Base
  belongs_to :game_type
  has_many :solutions
  has_many :tile_sets
  has_many :tiles, through: :solutions
  validates :name, :game_type, presence: true

  has_attached_file :image,
                    styles: {medium: '500x500>', thumb: '100x100>'}

  validates_attachment :image,
                       content_type: {content_type: %r{\Aimage\/.*\Z}}

  RATINGS = (1..5)

  def no_solutions
    solutions.pluck(:set).uniq.count
  end

  def solution_sets
    solutions.includes(:tile).group_by(&:set).map do |_, solutions|
      solutions.map(&:tile)
    end
  end

  def check_solution(solution_tile_ids)
    tile_ids = tiles.pluck(:id)
    max = tile_ids.count

    rating = calculate_rating(max, solution_tile_ids, tile_ids)

    RATINGS.take(rating).last
  end

  def calculate_rating(max, solution_tile_ids, tile_ids)
    case game_type_id
    when 2
      calculate_sequence_rating(max, solution_tile_ids, tile_ids)
    else
      calculate_subset_rating(max, solution_tile_ids, tile_ids)
    end
  end

  private

  def calculate_sequence_rating(max, solution_tile_ids, tile_ids)
    distance = Levenshtein.distance(solution_tile_ids, tile_ids)
    normalize(sequence_correctness(max, distance))
  end

  def calculate_subset_rating(max, solution_tile_ids, tile_ids)
    missing = (tile_ids - solution_tile_ids).size
    redundant = (solution_tile_ids - tile_ids).size

    normalize(subset_correctness(max, missing, redundant))
  end

  def normalize(score)
    [(score * RATINGS.size).ceil, 1].max
  end

  def sequence_correctness(max, distance)
    (max - distance) * 1.0 / max
  end

  def subset_correctness(max, missing, redundant)
    (max - missing - redundant) * 1.0 / max
  end
end

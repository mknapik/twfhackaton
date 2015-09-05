class Game < ActiveRecord::Base
  belongs_to :game_type
  has_many :solutions
  has_many :tile_sets

  validates :name, :game_type, presence: true

  def solution_sets
    solutions.includes(:tile).group_by(&:set).map do |set, solutions|
      solutions.map(&:tile)
    end
  end
end

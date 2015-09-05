class GameType < ActiveRecord::Base
  has_many :games

  validates :name, presence: true
end

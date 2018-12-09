class Player < ApplicationRecord
  scope :team, -> (team) { where team: team }
  belongs_to :team
end

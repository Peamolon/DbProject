class Dependency < ApplicationRecord
  has_many :held_positions, foreign_key: 'dependency_id'
end

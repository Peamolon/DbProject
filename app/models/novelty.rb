class Novelty < ApplicationRecord
  belongs_to :employer, foreign_key: "employer_id"
end

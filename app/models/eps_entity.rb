class EpsEntity < ApplicationRecord
  has_many :employees, foreign_key: "eps_id"
end

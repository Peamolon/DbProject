class HeldPosition < ApplicationRecord
  belongs_to :dependency
  has_many :employees
end

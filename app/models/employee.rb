class Employee < ApplicationRecord
  validates :salary, :join_date, presence: true
  belongs_to :user, foreign_key: "user_id"
  before_create :set_full_name
  belongs_to :held_position, foreign_key: "held_position_id"

  private
  def set_full_name
    if self.user.present?
      self.full_name = "#{self.user.first_name} #{self.user.last_name}"
    end
  end
end

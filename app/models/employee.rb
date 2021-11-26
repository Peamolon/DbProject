class Employee < ApplicationRecord
  #relationships
  validates :salary, :join_date, presence: true
  belongs_to :user, foreign_key: "user_id"
  belongs_to :eps_entity, foreign_key: "eps_id"
  belongs_to :afp_entity, foreign_key: "afp_entity_id"
  belongs_to :dependency, foreign_key: "dependency_id"
  belongs_to :held_position, foreign_key: "held_position_id"
  #call_backs
  before_create :set_full_name


  def eps_entity
    EpsEntity.find(self.eps_id) if self.eps_id.present?
  end

  def afp_entity
    AfpEntity.find(self.afp_entity_id) if self.afp_entity_id.present?
  end

  def table_name
    full_name = self.full_name.split(" ")
    return "#{self.user.last_name} #{self.user.first_name}"

  end

  private
  def set_full_name
    if self.user.present?
      self.full_name = "#{self.user.first_name} #{self.user.last_name}"
    end
  end
end

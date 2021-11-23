class User < ApplicationRecord
  has_one :employee, foreign_key: "employee_id"
  validates :first_name, presence: true
  validates :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def fully_signed?
    self.employee_id.present?
  end
end

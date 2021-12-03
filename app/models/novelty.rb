class Novelty < ApplicationRecord
  belongs_to :employee, foreign_key: "employee_id"
  validates :work_days, presence: true
  validates :bonus, presence: true
  validates :transport, presence: true
  validate :work_days_is_valid?
  validates :vacations_start_date, presence: true, if: :is_vacations?
  validates :vacations_end_date, presence: true, if: :is_vacations?

  validates :disability_start_date, presence: true, if: :is_inability?
  validates :disability_end_date, presence: true, if: :is_inability?


  def generate_vacations_days
    if self.novelty_type.present? && self.novelty_type == 'Vacations Novelty'
      vacations_days = self.vacations_end_date.day - self.vacations_start_date.day
      self.update(vacations_days: vacations_days)
    end
  end

  def is_inability?
    if self.novelty_type.present?
      if self.novelty_type == 'Disability Novelty'
        return true
      end
    end
    return false
  end

  def is_vacations?
    if self.novelty_type.present?
      if self.novelty_type == 'Vacations Novelty'
        return true
      end
    end
    return false
  end


  def work_days_is_valid?
    if self.work_days.present?
      errors.add(:work_days,'The maximum work days is 30') if self.work_days > 30
    end
  end

end

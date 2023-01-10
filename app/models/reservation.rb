class Reservation < ApplicationRecord

  belongs_to :guest

  validates :code, :status, :currency, :total_amount, :adults, :end_date, :start_date, presence: true
  validates :code, uniqueness: true
  validates :total_amount, numericality: { greater_than_or_equal_to: 0 }
  validate :duration_validation

  private

  def duration_validation
    errors.add(:end_date, "cannot be before or same with the start date") if end_date.to_i <= start_date.to_i
  end

end

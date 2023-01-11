class Reservation < ApplicationRecord

  belongs_to :guest

  validates :code, :status, :currency, :total_amount, :adults, :end_date, :start_date,
            :guest, :nights, presence: true
  validates :code, uniqueness: true
  validates :total_amount, numericality: { greater_than_or_equal_to: 0 }
  validate :duration_validation
  validate :number_of_guest_validation
  validate :number_of_nights_validation
  validate :total_amount_validation

  private

  def duration_validation
    errors.add(:end_date, "cannot be before or same with the start date") if end_date.to_i <= start_date.to_i
  end

  def number_of_guest_validation
    total_guests = adults + children + infants
    if total_guests != guests
      errors.add(:guest, "Guest number should be equal to total number of adults to infants")
    end
  end

  def number_of_nights_validation
    total_nights = (end_date.to_date - start_date.to_date).to_i
    if total_nights != nights
      errors.add(:night, "Total night number should be equal to duration of reservation")
    end
  end

  def total_amount_validation
    total_price = (security_price + payout_price)
    if total_price != total_amount
      errors.add(:total_amount, "Total amount is wrong please calculate it again")
    end
  end

end

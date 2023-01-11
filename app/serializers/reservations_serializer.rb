class ReservationsSerializer < ActiveModel::Serializer
  attributes :id, :status, :total_amount, :currency,
             :adults, :children, :infants, :code,
             :start_date, :end_date, :nights, :guest,
             :security_price, :payout_price
  
  belongs_to :guest
end

class ReservationsSerializer < ActiveModel::Serializer
  attributes :id, :status, :total_amount, :currency,
             :adults, :children, :infants, :code,
             :start_date, :end_date
  
  belongs_to :guest
end

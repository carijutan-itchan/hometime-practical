class AddGuestToReservation < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :guest, foreign_key: true, type: 'integer'
  end
end

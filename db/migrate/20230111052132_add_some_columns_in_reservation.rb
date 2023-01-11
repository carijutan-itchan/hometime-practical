class AddSomeColumnsInReservation < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :payout_price, :decimal 
    add_column :reservations, :security_price, :decimal
    add_column :reservations, :nights, :integer
    add_column :reservations, :guests, :integer
  end
end

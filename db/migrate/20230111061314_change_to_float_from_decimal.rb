class ChangeToFloatFromDecimal < ActiveRecord::Migration[7.0]
  def change
    change_column :reservations, :payout_price, :float 
    change_column :reservations, :security_price, :float
    change_column :reservations, :total_amount, :float
  end
end

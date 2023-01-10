class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :status
      t.decimal :total_amount
      t.string :currency
      t.integer :adults
      t.integer :children
      t.integer :infants
      t.string :code

      t.timestamps
    end
  end
end

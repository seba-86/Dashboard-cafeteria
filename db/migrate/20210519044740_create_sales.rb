class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.string :name
      t.string :origin
      t.integer :quantity
      t.integer :price
      t.date :date

      t.timestamps
    end
  end
end

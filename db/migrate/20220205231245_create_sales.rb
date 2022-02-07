class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.belongs_to :product, null: true, foreign_key: true, index: true
      t.belongs_to :inventory, null: true, foreign_key: true, index: true
      t.string :branch
      t.float :subtractive, default: 1

      t.timestamps
    end
  end
end

class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.belongs_to :ticket, null: true, foreign_key: true, index: true
      t.string :branch
      t.string :name
      t.string :type
      t.string :unit
      t.float :margin
      t.float :stock

      t.timestamps
    end
  end
end

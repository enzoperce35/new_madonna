class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.belongs_to :ticket, null: true, foreign_key: true, index: true
      t.string :branch
      t.string :name
      t.string :category
      t.float :price
      t.boolean :soft_deleted

      t.timestamps
    end
  end
end

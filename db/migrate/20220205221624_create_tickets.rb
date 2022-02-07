class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.integer :ticket_number
      t.string :author

      t.timestamps
    end
  end
end

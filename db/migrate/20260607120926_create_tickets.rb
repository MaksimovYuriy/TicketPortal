class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.string :subject
      t.text :body
      t.integer :status

      t.timestamps
    end
  end
end

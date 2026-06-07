class CreateTicketsQueues < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets_queues do |t|
      t.string :label
      t.integer :order_value

      t.timestamps
    end
  end
end

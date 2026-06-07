class CreateAgents < ActiveRecord::Migration[7.1]
  def change
    create_table :agents do |t|
      t.string :email
      t.string :encrypted_password
      t.string :name

      t.timestamps
    end
  end
end

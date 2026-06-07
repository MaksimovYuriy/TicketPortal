# frozen_string_literal: true

class RenamePasswordAttributeAgent < ActiveRecord::Migration[7.1]
  def change
    rename_column :agents, :encrypted_password, :password_digest
  end
end

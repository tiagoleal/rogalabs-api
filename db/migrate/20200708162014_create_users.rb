# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :reset_password_token
      t.datetime :reset_password_valid

      t.timestamps
    end
  end
end
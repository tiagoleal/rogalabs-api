# frozen_string_literal: true

class CreateComplaints < ActiveRecord::Migration[5.2]
  def change
    create_table :complaints do |t|
      t.text :description
      t.integer :status, default: 0
      t.float :latitude
      t.float :longitude
      t.text :adopted_measure
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

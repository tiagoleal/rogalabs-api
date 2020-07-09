# frozen_string_literal: true

class Complaint < ApplicationRecord
  belongs_to :user

  validates_presence_of :description, :latitude, :longitude
end

# frozen_string_literal: true

module Api
  module V1
    class ComplaintSerializer < ActiveModel::Serializer # >
      attributes :id, :description, :status, :latitude, :longitude, :adopted_measure
      belongs_to :user

      def user
        options = { each_serializer: Api::V1::UserSerializer }
        ActiveModelSerializers::SerializableResource.new(object.user, options)
      end
    end
  end
end

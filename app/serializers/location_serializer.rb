# frozen_string_literal: true

class LocationSerializer < Panko::Serializer
  attributes :id, :ip_address, :country_code, :country, :city, :latitude, :longitude, :mystery_value
end

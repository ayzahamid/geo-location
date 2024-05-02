# frozen_string_literal: true

class LocationsController < ApplicationController
  def find_location
    location = GeoLocationImporter::Location.find_by(ip_address: params[:ip_address])
    if location
      render json: LocationSerializer.new.serialize(location)
    else
      render json: 'Record Not Found'
    end
  end
end

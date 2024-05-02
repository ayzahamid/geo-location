# frozen_string_literal: true

class LocationsController < ApplicationController
  def find_location
    location = GeoLocationImporter::Location.find_by_ip_address(location_params[:ip_address])
    if location
      render json: LocationSerializer.new.serialize(location)
    else
      render json: { error: 'Record Not Found' }, status: 404
    end
  end

  private

  def location_params
    params.permit(:ip_address)
  end
end

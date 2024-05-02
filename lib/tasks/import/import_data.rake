# frozen_string_literal: true

require 'geo_location_importer'

namespace :import do
  desc 'Import geolocation data from a CSV file'
  task geolocation: :environment do
    file_path = "#{Rails.public_path}/csv/data_dump.csv"

    unless File.exist?(file_path)
      puts "File #{file_path} not found. Please provide the correct path"
      next
    end

    GeoLocationImporter::ImportCsv.call(file_path)

    puts 'Import process completed.'
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LocationsController, type: :request do
  describe 'GET /find_location' do
    let!(:geo_locations) { FactoryBot.create_list(:location, 100) }
    let(:valid_ip_address) { geo_locations.last.ip_address }
    let(:invalid_ip_address) { '123.255.121.000' }

    context 'with a valid IP address' do
      it 'returns a successful response with location data' do
        get '/find_location', params: { ip_address: valid_ip_address }

        data = JSON.parse(response.body)
        expect(response).to be_successful
        expect(data).to be_a(Hash)
        expect(data.keys).to eq(%w[id ip_address country_code country city latitude longitude
                                   mystery_value])
      end
    end

    context 'with an invalid IP address' do
      it 'returns a not found response' do
        get '/find_location', params: { ip_address: invalid_ip_address }
        expect(response).to have_http_status(:not_found)
        expect(JSON.parse(response.body)['error']).to eq('Record Not Found')
      end
    end
  end
end

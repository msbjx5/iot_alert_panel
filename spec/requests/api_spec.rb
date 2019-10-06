# frozen_string_literal: true

require 'rails_helper'

describe 'Api return search' do
  context 'Search MAC address' do
    let(:device) do
      Device.create(name: 'Ze', mac: 'ffffffffffff',
                    cel: '+5511966666666')
    end

    it 'Successfully returns cel and name' do
      get "/api/v1/search/#{device.mac}"

      expect(response).to have_http_status(:ok)
    end

    it 'Successfully returns cel and name' do
      get "/api/v1/search/#{device.mac}"
      resp = JSON.parse(response.body)

      expect(resp['name']).to eq(device.name)
      expect(resp['cel']).to eq(device.cel)
    end

    # habilitar esse teste com cuidado, ele enviará um sms
    xit 'sends an alert' do
      post '/api/v1/alert', params: { mac: device.mac }

      expect(response).to have_http_status(:ok)
    end
  end
end

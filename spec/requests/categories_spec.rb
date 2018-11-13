require 'rails_helper'

describe "categories' requests" do
  context 'GET /v1/categories' do
    let!(:category) { create(:category, name: 'Gold Furniture') }
    let!(:other_categories) { create_list(:category, 10) }

    before { get '/v1/categories' }

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns categories' do
      body = JSON.parse(response.body)
      expect(body['categories'].size).to eq(11)
      expect(body['categories'][0]['id']).to eq('gold-furniture')
      expect(body['categories'][0]['name']).to eq('Gold Furniture')
    end
  end
end

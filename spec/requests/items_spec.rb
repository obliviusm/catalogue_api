require 'rails_helper'

describe "items' requests" do
  context 'GET /v1/categories/:category_id/items' do
    let!(:category) { create(:category, name: 'Furniture') }
    let!(:item) { create(:item, name: 'Gold Table', category: category) }
    let!(:category_items) { create_list(:item, 5, category: category) }
    let!(:other_items) { create_list(:item, 10) }

    before { get '/v1/categories/furniture/items' }

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns pagination information' do
      expect(response.headers['Total']).to eq('6')
      expect(response.headers['Per-Page']).to eq('5')
    end

    it 'returns categories' do
      body = JSON.parse(response.body)
      expect(body['items'].size).to eq(5) # due to pagination
      expect(body['items'][0]['id']).to eq('gold-table')
      expect(body['items'][0]['name']).to eq('Gold Table')
    end
  end

  context 'GET /v1/items/:id' do
    let!(:item) { create(:item, name: 'Gold Furniture', price: 5.4, description: 'Buy it!') }

    before { get '/v1/items/gold-furniture' }

    it 'returns HTTP status 200' do
      expect(response).to have_http_status 200
    end

    it 'returns item' do
      body = JSON.parse(response.body)
      expect(body['item']['id']).to eq('gold-furniture')
      expect(body['item']['name']).to eq('Gold Furniture')
      expect(body['item']['price']).to eq('$5.40')
      expect(body['item']['description']).to eq('Buy it!')
    end
  end
end

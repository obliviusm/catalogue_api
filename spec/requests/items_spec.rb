require 'rails_helper'

describe 'GET /v1/items/:alias' do
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

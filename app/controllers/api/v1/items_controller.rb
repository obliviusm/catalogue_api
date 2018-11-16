class Api::V1::ItemsController < ApplicationController
  def_param_group :item do
    property :id, String, :desc => "Aliased id"
    property :name, String, :desc => "Name"
    property :price, String, :desc => "Price in USD string form: $12,345,67", required: false
    property :description, String, :desc => "Short description text", required: false
  end

  api :GET, '/categories/:category_id/items', 'Show list of items for category'
  param :category_id, String, :desc => "Category ID", :required => true
  param :page, String, :desc => "Page", :required => false
  returns :code => 200, :desc => "a successful response" do
    param :items, Array, :desc => "Items array", :required => true do
      param_group :item
    end
  end
  def index
    @items = paginate(
      Category.friendly.find(params[:category_id]).items,
      per_page: 8
    )
  end

  api :GET, '/items/:id', 'Show item details'
  param :id, String, :desc => "Item ID", :required => true
  returns :code => 200, :desc => "a successful response" do
    param :item, Hash, :desc => "Item info", :required => true do
      param_group :item
    end
  end
  def show
    @item = Item.friendly.find(params[:id])
  end
end

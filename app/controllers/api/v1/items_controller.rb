class Api::V1::ItemsController < ApplicationController
  def index
    @items = Category.friendly.find(params[:category_id]).items
  end

  def show
    @item = Item.friendly.find(params[:id])
  end
end

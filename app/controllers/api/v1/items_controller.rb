class Api::V1::ItemsController < ApplicationController
  def index
    @items = paginate(
      Category.friendly.find(params[:category_id]).items,
      per_page: 5
    )
  end

  def show
    @item = Item.friendly.find(params[:id])
  end
end

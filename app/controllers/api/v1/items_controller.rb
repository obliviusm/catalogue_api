class Api::V1::ItemsController < ApplicationController
  def show
    @item = Item.friendly.find(params[:id])
  end
end

class Api::V1::CategoriesController < ApplicationController
  api :GET, '/categories/', 'Show list of all categories'
  returns :code => 200, :desc => "a successful response" do
    param :categories, Array, :desc => "Categories array", :required => true do
      property :id, String, :desc => "Aliased id"
      property :name, String, :desc => "Name"
    end
  end
  def index
    @categories = Category.all
  end
end

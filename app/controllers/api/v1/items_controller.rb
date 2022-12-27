class Api::V1::ItemsController < Api::V1::BaseController
  before_action :authorize_request, except: %i[index create]
  skip_before_action :verify_authenticity_token, only: %i[index create]

  def index
    render json: Item.all, serialize: UserSerializer
  end

  def create
    @items = Item.create items_params
    if @items.save
      render json: { message: items_params }
    else
      render json: { message: "failed" }
    end
  end

  private

  def items_params
    params.permit(:name, :description, :category, :number_of_items, :price)
  end
end

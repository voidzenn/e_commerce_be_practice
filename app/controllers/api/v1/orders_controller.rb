class Api::V1::OrdersController < Api::V1::BaseController
  def index
    @order = Order.all
    render json: { message: @order }
  end
end

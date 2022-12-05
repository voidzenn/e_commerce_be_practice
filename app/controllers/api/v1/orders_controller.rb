class Api::V1::OrdersController < Api::V1::BaseController
  def index
    @order = Order.includes(:user, :item)
    render json: { message: JSON.parse(@order.to_json(:include => [:user, :item])) }
  end

  def create
    @order = Order.create order_params
    if @order.save
      render json: { message: 'success' }
    else
      render json: { message: 'failed' }
    end
  end

  private

  def order_params
    params.permit(:user_id, :item_id)
  end

end

class OrdersController < ApplicationController

  def index
    @products = Product.all
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.products.map{|e| e.stock}.index(0).nil?
      @order.products.map{|e| e.stock-=1}
      if @order.save    
        flash[:notice] = "購買成功，訂購明細已發送至您的Email"
        UserMailer.notify_order_create(@order).deliver_now!
        redirect_to orders_path
      else
        flash[:alert] = "姓名、地址、Email不可空白"
        redirect_to orders_path
      end
    else
      flash[:alert] = "訂購失敗，選購的商品已售完"
      redirect_to orders_path
    end  
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :address, :product_ids=>[])
  end

end

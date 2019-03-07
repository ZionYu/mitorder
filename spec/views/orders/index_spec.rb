require 'rails_helper'

RSpec.describe "orders/index.html.erb", type: :view do

    it 'can render' do
      @product = Product.create(name: "Macbook")
      @products = Array.new(4, @product)
      @order = Order.create(name: "Qoo", email:"test@example.com", address:"ooooo")
      render
      expect(rendered).to include("商品名稱")
      expect(rendered).to include("Macbook") 
    end
    
    it 'can show "sold out" when stock was zero' do
      @product = Product.create(stock: 0)
      @products = Array.new(2, @product)
      @order = Order.create(name: "Qoo", email:"test@example.com", address:"ooooo")
      render
      expect(rendered).to include("庫存量")
      expect(rendered).to include("sold out")   
    end
    
end
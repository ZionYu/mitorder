require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe "GET #index" do
    it "should assgins all products to @products" do
      product = Product.create(name:"TestPrduct", stock: 22)
      get :index
      expect(assigns(:products)).to eq [product]
    end

    it "should assigns a new order to @order" do
      get :index
      expect(assigns(:order)).to be_a_new(Order)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "should create a order" do
        valid_order_params = {name: "String", email: "Valid email", address: "Location", product_ids:[]}
        expect {
          post :create, params: {order: valid_order_params}
        }.to change(Order, :count).by(1)
      end

      it "should redirect to orders_path" do
         valid_order_params = {name: "String", email: "Valid email", address: "Location", product_ids:[]}
         post :create, params: {order: valid_order_params}
         expect(response).to redirect_to orders_path
      end
    end
  end
  
end
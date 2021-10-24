class CartItemsController < ApplicationController
    def new
        @cart_item = CartItem.new
    end

    def create
        @cart_item = Product.find_by(products: params[:name][:price])
        @cart_item.customer_id = current_customer.id
        if @cart_item.saveviewanalytics
            redirect_to cart_items_path
        else
            session[:cart_item] = @cart_item.attributes.slice(*cart_item_params.keys)
            @genres = Genre.all
            @item = Item.find_by(id:@cart_item.item_id)
            redirect_to item_path(@item.id), flash: {alert: '※個数を選択して下さい'}
        end
    end
    
    def destroy
    end
end

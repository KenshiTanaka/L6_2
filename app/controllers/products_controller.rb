class ProductsController < ApplicationController
    def index
        @product = Product.all
    end
    
    def new 
        @product =  Product.new
    end
    
    def create
        name = params[:product][:name]
        price = params[:product][:price]
        @product =Product.new(name: name,price: price)
       
        if @product.save
            flash[:notice] = '登録しました'
            redirect_to products_path
        else 
            render new_products_path
        end
    end
    
    def destroy
        product = Product.find(params[:id])
        product.destroy
        redirect_to root_path
    end
end

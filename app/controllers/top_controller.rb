class TopController < ApplicationController
    def main 
        if session[:cart_id]
            render'login'
        end
    end
end

class CustomersController < ApplicationController
    before_action :authenticate_user!, except: :index
    before_action :customer_params, only: :create
  
    def index
      @customer = Customer.all
    end
  
    def create
      @customer = Customer.new(customer_params)
      if @customer.valid?
        @customer.save
        redirect_to root_path
      else
        render :index
      end
  end
  
  private
  
    def customer_params
      params.require(:customer).permit()
    end
  
end

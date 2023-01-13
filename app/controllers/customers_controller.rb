class CustomersController < ApplicationController
    before_action :authenticate_user!, except: :index
  
  
    def index
      @item = Item.find(params[:item_id])
      @customer_form = CustomerForm.new
    end
  
    def create
      @item = Item.find(params[:item_id])
      @customer_form = CustomerForm.new(customer_params)
      if @customer_form.valid?

        @customer_form.save
        redirect_to root_path
      else
        render :index
      end
  end
  
  private
  
    def customer_params
      params.require(:customer_form).permit(:post_code, :city, :address, :building_name, :prefecture_id, :phone_number, :card).merge(user_id: current_user.id)

    end
end

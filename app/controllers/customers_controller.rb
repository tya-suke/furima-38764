class CustomersController < ApplicationController
    before_action :authenticate_user!
    before_action :non_purchased_item, only: [:index, :create]
  
    def index
      @customer_form = CustomerForm.new
      if @item.user_id = current_user
        redirect_to root_path
      end
    end
  
    def create
      @customer_form = CustomerForm.new(customer_params)
      if @customer_form.valid?
        pay_item
        @customer_form.save
        redirect_to root_path
      else
        render :index
      end
  end
  
  private
  
    def customer_params
      params.require(:customer_form).permit(:card_id, :post_code, :city, :address, :building_name, :prefecture_id, :phone_number).merge(user_id: current_user.id, item_id:params[:item_id], token: params[:token])
    end

    def pay_item
      
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
          amount: @item.price,  # 商品の値段
          card: customer_params[:token],    # カードトークン
          currency: 'jpy'                 # 通貨の種類（日本円）
        )
  end

  def non_purchased_item
    @item = Item.find(params[:item_id])
    # redirect_to root_path if current_user.id == @item.user || @item.customer.present?
  end

end

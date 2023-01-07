class ItemsController < ApplicationController
   before_action :move_to_index, except: [:index, :show]
   before_action :authenticate_user!
  def index

    # @items = Item.all.order("created_at DESC")

    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)


    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def move_to_index
    return if user_signed_in?
  end

  end

  # def new
    # @item = Item.new
  # end

  # def create
    # @item = Item.create(item_params)
    # if @item.save
      # redirect_to root_path(@item)
  # end

  # def move_to_index
    # return if user_signed_in?

    # redirect_to action: :index
    # end
  # end




  # private


  def item_params
    params.require(:item).permit(:image, :product, :info, :price, :category_id, :condition_id,:postage_type_id,:days_to_ship_id, :prefecture_id).merge(user_id: current_user.id)
  end



end

class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  
  
  def index
  @items = Item.order("created_at DESC")
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

  def show
    
  end

  def edit
    @card = @item.card
    redirect_to root_path if @item.user_id != current_user.id || !@card.nil?
  end
    # if current_user.id != @item.user_id
      # redirect_to root_path
    # end 
    # @card = @item.card
    # if @card.present?
        # redirect_to root_path
    # end
  # end

  def update
    @item.update(item_params)
    if @item.valid?
        redirect_to item_path(item_params) 
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
    @item.destroy
    redirect_to root_path
    else
      redirect_to root_path
    end
  end


  private
  def item_params
      params.require(:item).permit(:image, :product, :info, :price, :category_id, :condition_id,:postage_type_id,:days_to_ship_id, :prefecture_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
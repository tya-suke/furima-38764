class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
   
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if@item.valid?
        redirect_to item_path(item_params) 
    else
      render :edit
    end
  end

  
  end

  private
  def item_params
      params.require(:item).permit(:image, :product, :info, :price, :category_id, :condition_id,:postage_type_id,:days_to_ship_id, :prefecture_id).merge(user_id: current_user.id)
  end

  

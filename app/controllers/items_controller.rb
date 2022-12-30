class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]

   def index
  end

  # def new
    @item = Item.new
  end

  # def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path(@item)
  end

  # def move_to_index
    return if user_signed_in?

    redirect_to action: :index
    end
  end



  private

  # def item_params
    # params.require(:item).permit(:name, :image, :text).merge(user_id: current_user.id)
  end
end


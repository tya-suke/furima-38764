class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
  end

  def move_to_index
    return if user_signed_in?

    redirect_to action: :index
  end
end

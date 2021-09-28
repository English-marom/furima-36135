class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  #before_action :move_to_index, except: [:index, :show]
  def index
  end
  
  def new
    @items = Item.new
  end

  def create
    @items = items.new(items_params)
    if @items.save
      redirect_to new_item_path
    else
      render :new
    end
  end
end
#   private
# def move_to_index
#   unless user_signed_in?
#     redirect_to action: :index
#   end


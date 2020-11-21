class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update]

  def index
   @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create  
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def  update
    if @item.update(item_params) 
      redirect_to item_path
    else
      render :edit
    end
  end

  def show  
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id 
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
     end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :condition_id, :delivery_fee_id, :area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end
end
class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
  end

  def create
    @item = Item.new(item_params)
    @user = User.find(session[:user][0]['id'])
    @item.user = @user
    if @item.save
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:title, :content)
  end
end

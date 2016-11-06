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

  def destroy
    Item.find(params[:id]).destroy
    redirect_to myaccount_path
  end

  def search
    @items = Item.where("title LIKE :query1 OR content LIKE :query2",
      query1: "%#{params[:q]}%",
      query2: "%#{params[:q]}%")
  end

  private
  def item_params
    params.require(:item).permit(:title, :content, :image)
  end
end

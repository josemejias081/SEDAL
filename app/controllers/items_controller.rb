class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy]
  before_action :set_evaluation
  before_action :authenticate_user!

  def new
    @scales = Scale.all
    @item = @evaluation.items.build
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to @evaluation
      else
        render :new
      end
    end

  def edit
    @scales = Scale.all
    @item = Item.find(params[:id])
      
  end

  def update    
    if @item.update(item_params)
      redirect_to @evaluation
    else
      render :edit
    end    
  end

  def destroy
    @item.destroy
    redirect_to @evaluation
  end

  def mostrar
    @items = Item.all
  end
  private
    
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:description, :evaluation_id, :scale_id)
    end

    def set_evaluation
      @evaluation = Evaluation.find(params[:evaluation_id])
    end
end

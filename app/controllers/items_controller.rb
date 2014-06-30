class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to :back, notice: 'Item was successfully created.'
    else
      render action: 'new'
    end

  end

  def update
    if @item.update(item_params)
      redirect_to :back, notice: 'Item was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to @item.project
  end

  private

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :type, :project_id, :status, :item_type, :created_by)
    end

end

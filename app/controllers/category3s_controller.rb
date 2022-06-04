class Category3sController < ApplicationController
  before_action :set_category3, only: [:edit, :update, :destroy]

  def index
    @category3 = Category3.new
    @category3s = Category3.all
  end

  def create
    @category3 = Category3.new(category3_params)
    if @category3.save
      redirect_to category3s_path
    else
      @category3s = Category3.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @category3.update(category3_params)
      redirect_to category3s_path
    else
      render 'edit'
    end
  end

  def destroy
    @category3.destroy
    redirect_to category3s_path
  end

  private

    def set_category3
      @category3 = Category3.find(params[:id])
    end

    def category3_params
      params.require(:category3).permit(:name)
    end
end
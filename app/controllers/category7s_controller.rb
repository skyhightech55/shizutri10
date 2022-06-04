class Category7sController < ApplicationController
  before_action :set_category7, only: [:edit, :update, :destroy]

  def index
    @category7 = Category7.new
    @category7s = Category7.all
  end

  def create
    @category7 = Category7.new(category7_params)
    if @category7.save
      redirect_to category7s_path
    else
      @category7s = Category7.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @category7.update(category7_params)
      redirect_to category7s_path
    else
      render 'edit'
    end
  end

  def destroy
    @category7.destroy
    redirect_to category7s_path
  end

  private

    def set_category7
      @category7 = Category7.find(params[:id])
    end

    def category7_params
      params.require(:category7).permit(:name)
    end
end

class Category4sController < ApplicationController
  before_action :set_category4, only: [:edit, :update, :destroy]

  def index
    @category4 = Category4.new
    @category4s = Category4.all
  end

  def create
    @category4 = Category4.new(category4_params)
    if @category4.save
      redirect_to category4s_path
    else
      @category4s = Category4.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @category4.update(category4_params)
      redirect_to category4s_path
    else
      render 'edit'
    end
  end

  def destroy
    @category4.destroy
    redirect_to category4s_path
  end

  private

    def set_category4
      @category4 = Category4.find(params[:id])
    end

    def category4_params
      params.require(:category4).permit(:name)
    end
end
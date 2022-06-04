class Category6sController < ApplicationController
  before_action :set_category6, only: [:edit, :update, :destroy]

  def index
    @category6 = Category6.new
    @category6s = Category6.all
  end

  def create
    @category6 = Category6.new(category6_params)
    if @category6.save
      redirect_to category6s_path
    else
      @category6s = Category6.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @category6.update(category6_params)
      redirect_to category6s_path
    else
      render 'edit'
    end
  end

  def destroy
    @category6.destroy
    redirect_to category6s_path
  end

  private

    def set_category6
      @category6 = Category6.find(params[:id])
    end

    def category6_params
      params.require(:category6).permit(:name)
    end
end

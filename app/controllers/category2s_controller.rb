class Category2sController < ApplicationController
  before_action :set_category2, only: [:edit, :update, :destroy]
  
  def index
    @category2 = Category2.new
    @category2s = Category2.all
  end

  def new
    @category2 = Category2.new
    @category2s = Category2.all
  end

  def create
    @category2 = Category2.new(category_params)
    if @category2.save
      redirect_to category2s_path
    else
      @category2s = Categorys.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @category2s.update(category2_params)
      redirect_to category2s_path
    else
      render 'edit'
    end
  end

  def destroy
    @category2.destroy
    redirect_to category2s_path
  end

  private

    def set_category2
      @category2 = Category2.find(params[:id])
    end

    def category2_params
      params.require(:category2).permit(:name)
    end
end
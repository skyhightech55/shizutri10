class Category5sController < ApplicationController
  def index
    @category5 = Category5.new
    @category5s = Category5.all
  end

  def create
    @category5 = Category5.new(category5_params)
    if @category5.save
      redirect_to category5s_path
    else
      @category5s = Category5.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @category5.update(category5_params)
      redirect_to category5s_path
    else
      render 'edit'
    end
  end

  def destroy
    @category5.destroy
    redirect_to category5s_path
  end

  private

    def set_category5
      @category5 = Category5.find(params[:id])
    end

    def category5_params
      params.require(:category5).permit(:name)
    end
end

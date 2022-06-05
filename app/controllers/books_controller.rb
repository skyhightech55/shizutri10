class BooksController < ApplicationController
  def new
    
    @book = Book.new
    @category_parent_array = Category.category_parent_array_create
    @category2_parent_array = Category2.category2_parent_array_create
    @category3_parent_array = Category3.category3_parent_array_create
    @category4_parent_array = Category4.category4_parent_array_create
    @category5_parent_array = Category5.category5_parent_array_create
    @category6_parent_array = Category6.category6_parent_array_create
    @category7_parent_array = Category7.category7_parent_array_create
  end
  
  def create
    
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      BookCategory.maltilevel_category_create(
        @book,
        params[:@category_parent_id],
        params[:children_id],
        params[:grandchildren_id]
      )
      redirect_to books_path
    else
      @books = Book.all
      @category_parent_array = Category.category_parent_array_create
      render 'index'
    end
    
    if @book.save
      BookCategory2.maltilevel_category2_create(
        @book,
        params[:parent_id],
        params[:children_id],
        params[:grandchildren_id]
      )
      
    else
      @books = Book.all
      @category2_parent_array = Category2.category2_parent_array_create
      render 'index'
    end
    if @book.save
      BookCategory3.maltilevel_category3_create(
        @book,
        params[:parent_id],
        params[:children_id],
        params[:grandchildren_id]
      )
      
    else
      @books = Book.all
      @category3_parent_array = Category3.category3_parent_array_create
      render 'index'
    end

    if @book.save
      BookCategory4.maltilevel_category4_create(
        @book,
        params[:@category4_parent_id],
        params[:children_id],
        params[:grandchildren_id]
      )
      
    else
      @books = Book.all
      @category4_parent_array = Category4.category4_parent_array_create
      render 'index'
    end

    if @book.save
      BookCategory5.maltilevel_category5_create(
        @book,
        params[:parent_id],
        params[:children_id],
        params[:grandchildren_id]
      )
      
    else
      @books = Book.all
      @category5_parent_array = Category5.category5_parent_array_create
      render 'index'
    end

    if @book.save
      BookCategory6.maltilevel_category6_create(
        @book,
        params[:parent_id],
        params[:children_id],
        params[:grandchildren_id]
      )
      
    else
      @books = Book.all
      @category6_parent_array = Category6.category6_parent_array_create
      render 'index'
    end

    if @book.save
      BookCategory7.maltilevel_category7_create(
        @book,
        params[:parent_id],
        params[:children_id],
        params[:grandchildren_id]
      )
      
    else
      @books = Book.all
      @category7_parent_array = Category7.category7_parent_array_create
      render 'index'
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @category_parent_array = Category.category_parent_array_create
    @category2_parent_array = Category2.category2_parent_array_create
    @category3_parent_array = Category3.category3_parent_array_create
    @category4_parent_array = Category4.category4_parent_array_create
    @category5_parent_array = Category5.category5_parent_array_create
    @category6_parent_array = Category6.category6_parent_array_create
    @category7_parent_array = Category7.category7_parent_array_create
  end

  def get_category_children
    @category_children = Category.find(params[:@category_parent_id]).children
  end
  
  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:children_id]).children
  end

  def get_category2_children
    @category2_children = Category2.find(params[:parent_id]).children
  end
  
  def get_category2_grandchildren
    @category2_grandchildren = Category2.find(params[:children_id]).children
  end

  def get_category3_children
    @category3_children = Category3.find(params[:parent_id]).children
  end

  def get_category3_grandchildren
    @category3_grandchildren = Category3.find(params[:children_id]).children
  end

  def get_category4_children
    @category4_children = Category4.find(params[:parent_id]).children
  end

  def get_category4_grandchildren
    @category4_grandchildren = Category4.find(params[:children_id]).children
  end

  def get_category5_children
    @category5_children = Category5.find(params[:parent_id]).children
  end

  def get_category5_grandchildren
    @category5_grandchildren = Category5.find(params[:children_id]).children
  end

  def get_category6_children
    @category6_children = Category6.find(params[:parent_id]).children
  end

  def get_category6_grandchildren
    @category6_grandchildren = Category6.find(params[:children_id]).children
  end

  def get_category7_children
    @category7_children = Category7.find(params[:parent_id]).children
  end

  def get_category7_grandchildren
    @category7_grandchildren = Category7.find(params[:children_id]).children
  end


  def destroy
    @books.destroy
    redirect_to books_path
  end

  

  def show
    @book = Book.find(params[:id])
  end

  def edit
    
    @category_parent_array = Category.category_parent_array_create
  end

  def update
    if @book.update(book_params)
      book_categories = BookCategory.where(book_id: @book.id)
      book_categories.destroy_all
      BookCategory.maltilevel_category_create(
        @book,
        params[:parent_id],
        params[:children_id],
        params[:grandchildren_id]
      )
      redirect_to @book
    else
      @category_parent_array = Category.category_parent_array_create
      render 'edit'
    end
  end

  

  private

  def book_params
    params.require(:book).permit(:title, :body, { category_ids: [] })
    params.require(:book).permit(:title, :body, { category2_ids: [] })
    params.require(:book).permit(:title, :body, { category3_ids: [] })
    params.require(:book).permit(:title, :body, { category4_ids: [] })
    params.require(:book).permit(:title, :body, { category5_ids: [] })
    params.require(:book).permit(:title, :body, { category6_ids: [] })
    params.require(:book).permit(:title, :body, { category7_ids: [] })
  end
end

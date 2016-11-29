class CategoriesController < ApplicationController
  before_action :set_category, only: [:destroy]

  @@category_list = []

  def add_all_categories
    @categories = Category.all?
    @categories.each do |c|
      if c.name not in @@category.list
        @@category_list.push(c.name)
      end
    end
  end

  def new
  	@category = Category.new()
  end

  def create
  	@category = Category.new(category_params)

  	if @category.save
      redirect_to categories_index_path, notice: 'Favorite was successfully created.' 
    else
      render :new
    end
  end

  def index
  	@categories = Category.all.order(:name)
  	@category = Category.new()
  end

  def update
  end

  def destroy
  	@category.destroy
  	@categories = Category.all
  	@category = Category.new
  	respond_to do |format|
  		format.html { redirect_to categories_path, notice: 'Category was successfully deleted.'}
  		format.json { head :no_content }
  	end
  end

  private

  def category_params
  	params.require(:category).permit(:name)
  end

  def set_category
  	@category = Category.find(params[:id])
  end

end

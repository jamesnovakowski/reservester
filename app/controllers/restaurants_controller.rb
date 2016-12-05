class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :favorite, :add_category, :remove_category]
  before_action :set_category, only: [:add_category, :remove_category]
  before_action :check_user_status, only: [:new, :edit, :create, :update, :destroy, :add_category, :remove_category]
  before_action :check_is_owner, only: [:edit, :update, :destroy, :add_category, :remove_category]

  
  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    #Wrap in if statement so that only Owners can see this list.
    #On second thought, make a different page for showing all users who marked restaurant as a favorite.
    @favorited_by = @restaurant.favorited_by #leaving for now, so I can validate it's working.
    if @restaurant.reviews
      @reviews = @restaurant.reviews
      @reviewed_by = @restaurant.reviewed_by
    end
    @categories = @restaurant.categories.order(:name)
    @all_categories = Category.all.order(:name)
    @category = Category.new
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to @restaurant, notice: 'Restaurant was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def favorite
    
    if current_user.favorite_restaurants.include?(@restaurant)
      current_user.favorite_restaurants.delete(@restaurant)
      redirect_to :back, notice: "You removed #{@restaurant.name} from your favorites."
    else
      current_user.favorite_restaurants << @restaurant
      redirect_to :back, notice: "You added #{@restaurant.name} to your favorites."
    end 

  end

  def add_category
    category = Category.find_by(name: params[:category])

    if category === nil
      redirect_to @restaurant, notice: "There is no category by the name #{params[:category]}."
    else
      if @restaurant.categories.include?(category)
        redirect_to :back, notice: "#{category.name} is already in the restaurant categoies."
      else
        @restaurant.categories << @category
        redirect_to :back, notice: "You added #{category.name} to the restaurant categories."
      end
    end
  end

  def remove_category
    category = Category.find_by(name: params[:category])

    @restaurant.categories.delete(category)

    redirect_to :back, notice: "You have removed #{category.name} from the restaurant categories."
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :image, :favorite)
    end

    def favorite_params
      params.require(:user_id, :id)
    end

    def set_category
      @category = Category.where(name: params[:category])
    end

    def check_user_status
      if current_user && current_user.is_owner?
        true
      else
        redirect_to :back, notice: "Your account does not have permission to modify #{@restaurant.name}"
      end
    end
    
    def check_is_owner
      if current_user && current_user.id == @restaurant.user_id
        true
      else
        redirect_to :back, notice: "You are not an owner of #{@restaurant.name}, and cannot make changes to this restaurant."
      end
    end
    
  

end

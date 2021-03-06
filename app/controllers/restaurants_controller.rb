class RestaurantsController < ApplicationController
    before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

    # GET /restaurants
    # GET /restaurants.json
    def index
        if params[:search]
            @restaurants = Restaurant.without_deleted.search(params[:search]).order('name ASC').paginate(:page => params[:page], :per_page => 10)
        else
            @restaurants = Restaurant.without_deleted.order('name ASC').paginate(:page => params[:page], :per_page => 10)
        end
    end

    # GET /restaurants/1
    # GET /restaurants/1.json
    def show
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

        respond_to do |format|
            if @restaurant.save
                format.html { redirect_to @restaurant, flash: {:success => 'Restaurante cadastrado com sucesso.'} }
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
                format.html { redirect_to @restaurant,flash: {:success => 'Restaurante alterado com sucesso.'} }
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
        puts @restaurant
        @restaurant.destroy
        respond_to do |format|
            format.html { redirect_to restaurants_url, flash: {:success => 'Restaurante cancelado com sucesso.'} }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
        @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
        params.require(:restaurant).permit(:name, :active)
    end
end

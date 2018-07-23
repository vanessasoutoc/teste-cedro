module API  
    module V1
        class Restaurants < Grape::API
            
            include API::V1::Defaults

            resource :restaurants do
                desc "Return restaurant not deleted"
                params do
                    requires :page, type: String, desc: "page of the 
restaurants"
                    requires :per_age, type: String, desc: "per-page of the 
restaurants"
                end

                get "", root: :restaurants do
                    restaurants = Restaurant.without_deleted.order('name ASC').paginate(:page => params[:page], :per_page => params[:per_page])

                end

                desc "Return a restaurant"
                params do
                    requires :id, type: String, desc: "ID of the 
restaurant"
                end

                get ":id", root: :restaurant do
                    Restaurant.where(id: permitted_params[:id]).without_deleted.first!
                end

                desc "Create a restaurant"
                params do 
                    requires :name, type: String, desc: "Name of the Restaurant", message: 'Insira o nome do restaurante'
                end
                post "", root: :restaurant do
                    @restaurant = {
                        name: params[:name]
                        }
                    Restaurant.create(@restaurant)
                end

                desc "Update a restaurant",
                params: {
                    "name" => {
                        description: "Name of the restaurant",
                        required: true,
                        }
                    }
                params do 
                    requires :id, type: String, desc: 'ID of the restaurant'
                end
                put ":id", root: :restaurant do

                    restaurant = Restaurant.where(id: permitted_params[:id])

                    restaurant.update({name: params[:name]})
                    #Restaurant.update(@restaurant)
                end

                desc "Deleted a restaurant"
                params do 
                    requires :id, type: String, desc: 'ID of the restaurant'
                end
                delete ":id", root: :restaurant do                    
                    restaurant = Restaurant.where(id: permitted_params[:id])
                    restaurant.update({deleted_at: DateTime.now.to_s})
                end

            end
        end
    end
end  

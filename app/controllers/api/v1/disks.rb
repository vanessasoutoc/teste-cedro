module API  
    module V1
        class Disks < Grape::API
            
            include API::V1::Defaults

            resource :disks do
                desc "Return disk not deleted"
                params do
                    requires :page, type: String, desc: "page of the 
disks"
                    requires :per_age, type: String, desc: "per-page of the 
disks"
                end

                get "", root: :disks do
                    disks = Disk.without_deleted.order('name ASC').paginate(:page => params[:page], :per_page => params[:per_page])

                end

                desc "Return a disk"
                params do
                    requires :id, type: String, desc: "ID of the 
disk"
                end

                get ":id", root: :disk do
                    Disk.where(id: permitted_params[:id]).without_deleted.first!
                end

                desc "Create a disk"
                params do 
                    requires :restaurant_id, type: Integer, desc: "Id of Restaurant"
                    requires :name, type: String, desc: "Name of the Disk"
                    requires :price, type:Integer, desc: "Price of the Disk"
                end
                post "", root: :disk do
                    @disk = {
                        restaurant_id: params[:restaurant_id],
                        name: params[:name],
                        price: params[:price]
                        }
                    Disk.create(@disk)
                end

                desc "Update a disk",
                params: {
                    "name" => {
                        description: "Name of the disk",
                        required: true,
                        }
                    }
                params do 
                    requires :id, type: String, desc: 'ID of the disk'
                end
                put ":id", root: :disk do

                    disk = Disk.where(id: permitted_params[:id])

                    disk.update({name: params[:name]})

                end

                desc "Deleted a disk"
                params do 
                    requires :id, type: String, desc: 'ID of the disk'
                end
                delete ":id", root: :disk do                    
                    disk = Disk.where(id: permitted_params[:id])
                    disk.update({deleted_at: DateTime.now.to_s})
                end

            end
        end
    end
end  

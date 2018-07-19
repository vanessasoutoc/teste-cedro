require "grape-swagger"

module API  
    module V1
        class Base < Grape::API

            add_swagger_documentation(
                api_version: "v1",
                hide_documentation_path: false,
                mount_path: "/api/v1/swagger_doc",
                hide_format: true
                )

        end
    end
end  
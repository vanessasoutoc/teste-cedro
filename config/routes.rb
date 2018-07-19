Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
    mount GrapeSwaggerRails::Engine, at: "/documentation"
    mount API::Base, at: "/"
    
    root to: 'home#index'
    
end

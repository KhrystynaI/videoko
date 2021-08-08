Rails.application.routes.draw do

  mount Spree::Core::Engine, at: '/'
  Spree::Core::Engine.routes.draw do
    
  namespace :admin do
      get "destroy_video/:id", controller: "products", action: "destroy_video",  as: :destroy_video
      get "search_taxonomy/:id", controller: "products", action: "search_taxonomy",  as: :search_taxonomy
      post "rate", controller: "products", action: "rate", as: :rate
  end
end
end

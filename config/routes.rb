Rails.application.routes.draw do

  mount Spree::Core::Engine, at: '/'
  Spree::Core::Engine.routes.draw do
    get "contact", controller: "home", action: "contact",  as: :contact
  namespace :admin do
      get "destroy_video/:id", controller: "products", action: "destroy_video",  as: :destroy_video
      get "search_taxonomy", controller: "products", action: "search_taxonomy",  as: :search_taxonomy
      post "rate", controller: "products", action: "rate", as: :rate
  end
end
end

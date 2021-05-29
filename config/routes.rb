Rails.application.routes.draw do
  resources :payments
  resources :ratings
  resources :cart_items
  resources :carts do
    collection do
      post 'add_to_cart'
    end
  end
  resources :orders
  resources :items
  resources :shop_items
  resources :shops do 
    member do
      get 'get_item_list'
    end
  end
  resources :shop_owners
  resources :delivery_person_locations
  resources :delivery_people
  resources :addresses
  resources :users do 
    member do
      get 'get_nearby_shops'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

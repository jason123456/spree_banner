Spree::Core::Engine.routes.draw do
  
  namespace :admin do
    resources :banner_boxes do
      collection do
        post :update_positions
        get :find_promotion
      end
      member do
        get :clone
      end
    end
    resource :banner_box_settings
  end
  
end

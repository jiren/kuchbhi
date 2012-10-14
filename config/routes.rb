Kuchbhi::Application.routes.draw do

  match '/twitter/signin' => redirect('/auth/twitter')
  match '/facebook/signin' => redirect('/auth/facebook')
  match '/signout' => 'auth_services#signout'

  match '/auth/:service/callback', :to => "auth_services#create"
  match '/auth/failure', :to => "auth_services#failure"
  
  resources :ads do
    member do
      put :publish
    end
    get :autocomplete_category_name, :on => :collection
  end

  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

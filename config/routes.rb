AjaxDemo::Application.routes.draw do
  root :to => "Users#new"

  resources :photos, :only => [:show] do
    resources :tags, :only => [:new, :create, :update]
  end
  resource :session
  resources :users do
    resource :friendship, :only => [:create, :destroy]
    resources :photos, :only => [:new, :create, :index]
  end

end

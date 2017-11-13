Rails.application.routes.draw do

    resources :groups
    root "contacts#index"
    resources :contacts, only: [:new, :create, :destroy, :edit, :update, :show]
    get "contacts/find" => "contacts#find", as: :find_contact

end

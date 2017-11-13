Rails.application.routes.draw do

    resources :groups
    resources :contacts, only: [:new, :create, :destroy, :edit, :update, :show]
    root "contacts#index"
    get "contacts/find" => "contacts#find", as: :find_contact

end

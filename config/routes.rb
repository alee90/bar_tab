Rails.application.routes.draw do
  scope module: :v1 do
    devise_for :users
    root 'home#index'
    get '/users/:user_id/bars/new', to: 'bars#new', as: 'bar_new'
    put '/users/:user_id/bars/:id/remove' => 'bars#remove_bar', as: 'remove_bar'
    put '/users/:user_id/bars/:bar_id/entries/:id/remove' => 'entries#remove_entry', as: 'remove_entry'
    get '/users/:id' => 'users#show'
    resources :users do
      resources :bars do
        resources :entries
      end
    end
  end

end

#                   Prefix Verb   URI Pattern                                               Controller#Action
#         new_user_session GET    /users/sign_in(.:format)                                  v1/sessions#new
#             user_session POST   /users/sign_in(.:format)                                  v1/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                                 v1/sessions#destroy
#            user_password POST   /users/password(.:format)                                 v1/passwords#create
#        new_user_password GET    /users/password/new(.:format)                             v1/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)                            v1/passwords#edit
#                          PATCH  /users/password(.:format)                                 v1/passwords#update
#                          PUT    /users/password(.:format)                                 v1/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                                   v1/registrations#cancel
#        user_registration POST   /users(.:format)                                          v1/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                                  v1/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                                     v1/registrations#edit
#                          PATCH  /users(.:format)                                          v1/registrations#update
#                          PUT    /users(.:format)                                          v1/registrations#update
#                          DELETE /users(.:format)                                          v1/registrations#destroy
#                     root GET    /                                                         v1/home#index
#                  bar_new GET    /users/:user_id/bars/new(.:format)                        v1/bars#new
#               remove_bar PUT    /users/:user_id/bars/:id/remove(.:format)                 v1/bars#remove_bar
#             remove_entry PUT    /users/:user_id/bars/:bar_id/entries/:id/remove(.:format) v1/entries#remove_entry
#                          GET    /users/:id(.:format)                                      v1/users#show
#         user_bar_entries GET    /users/:user_id/bars/:bar_id/entries(.:format)            v1/entries#index
#                          POST   /users/:user_id/bars/:bar_id/entries(.:format)            v1/entries#create
#       new_user_bar_entry GET    /users/:user_id/bars/:bar_id/entries/new(.:format)        v1/entries#new
#      edit_user_bar_entry GET    /users/:user_id/bars/:bar_id/entries/:id/edit(.:format)   v1/entries#edit
#           user_bar_entry GET    /users/:user_id/bars/:bar_id/entries/:id(.:format)        v1/entries#show
#                          PATCH  /users/:user_id/bars/:bar_id/entries/:id(.:format)        v1/entries#update
#                          PUT    /users/:user_id/bars/:bar_id/entries/:id(.:format)        v1/entries#update
#                          DELETE /users/:user_id/bars/:bar_id/entries/:id(.:format)        v1/entries#destroy
#                user_bars GET    /users/:user_id/bars(.:format)                            v1/bars#index
#                          POST   /users/:user_id/bars(.:format)                            v1/bars#create
#             new_user_bar GET    /users/:user_id/bars/new(.:format)                        v1/bars#new
#            edit_user_bar GET    /users/:user_id/bars/:id/edit(.:format)                   v1/bars#edit
#                 user_bar GET    /users/:user_id/bars/:id(.:format)                        v1/bars#show
#                          PATCH  /users/:user_id/bars/:id(.:format)                        v1/bars#update
#                          PUT    /users/:user_id/bars/:id(.:format)                        v1/bars#update
#                          DELETE /users/:user_id/bars/:id(.:format)                        v1/bars#destroy
#                    users GET    /users(.:format)                                          v1/users#index
#                          POST   /users(.:format)                                          v1/users#create
#                 new_user GET    /users/new(.:format)                                      v1/users#new
#                edit_user GET    /users/:id/edit(.:format)                                 v1/users#edit
#                     user GET    /users/:id(.:format)                                      v1/users#show
#                          PATCH  /users/:id(.:format)                                      v1/users#update
#                          PUT    /users/:id(.:format)                                      v1/users#update
#                          DELETE /users/:id(.:format)                                      v1/users#destroy
Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'home' => 'home#home'
  get 'reel' => 'users#show'
  get '/users/:id/search', to: 'users#search', as: 'bar_search'
  put '/users/:user_id/bars/:id/remove' => 'bars#remove_bar', as: 'remove_bar'
  get '/search' => 'yelp#woop'
  get '/yelp/search/:data' => 'yelp#search'



  resources :users do
    resources :bars do
      resources :entries
    end
  end

  resources :yelp

end


#                   Prefix Verb   URI Pattern                                             Controller#Action
#         new_user_session GET    /users/sign_in(.:format)                                devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                                devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                               devise/sessions#destroy
#            user_password POST   /users/password(.:format)                               devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)                           devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)                          devise/passwords#edit
#                          PATCH  /users/password(.:format)                               devise/passwords#update
#                          PUT    /users/password(.:format)                               devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                                 devise/registrations#cancel
#        user_registration POST   /users(.:format)                                        devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                                devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                                   devise/registrations#edit
#                          PATCH  /users(.:format)                                        devise/registrations#update
#                          PUT    /users(.:format)                                        devise/registrations#update
#                          DELETE /users(.:format)                                        devise/registrations#destroy
#                     root GET    /                                                       home#index
#                     home GET    /home(.:format)                                         home#home
#                     reel GET    /reel(.:format)                                         users#show
#               bar_search GET    /users/:id/search(.:format)                             users#search
#         user_bar_entries GET    /users/:user_id/bars/:bar_id/entries(.:format)          entries#index
#                          POST   /users/:user_id/bars/:bar_id/entries(.:format)          entries#create
#       new_user_bar_entry GET    /users/:user_id/bars/:bar_id/entries/new(.:format)      entries#new
#      edit_user_bar_entry GET    /users/:user_id/bars/:bar_id/entries/:id/edit(.:format) entries#edit
#           user_bar_entry GET    /users/:user_id/bars/:bar_id/entries/:id(.:format)      entries#show
#                          PATCH  /users/:user_id/bars/:bar_id/entries/:id(.:format)      entries#update
#                          PUT    /users/:user_id/bars/:bar_id/entries/:id(.:format)      entries#update
#                          DELETE /users/:user_id/bars/:bar_id/entries/:id(.:format)      entries#destroy
#                user_bars GET    /users/:user_id/bars(.:format)                          bars#index
#                          POST   /users/:user_id/bars(.:format)                          bars#create
#             new_user_bar GET    /users/:user_id/bars/new(.:format)                      bars#new
#            edit_user_bar GET    /users/:user_id/bars/:id/edit(.:format)                 bars#edit
#                 user_bar GET    /users/:user_id/bars/:id(.:format)                      bars#show
#                          PATCH  /users/:user_id/bars/:id(.:format)                      bars#update
#                          PUT    /users/:user_id/bars/:id(.:format)                      bars#update
#                          DELETE /users/:user_id/bars/:id(.:format)                      bars#destroy
#                    users GET    /users(.:format)                                        users#index
#                          POST   /users(.:format)                                        users#create
#                 new_user GET    /users/new(.:format)                                    users#new
#                edit_user GET    /users/:id/edit(.:format)                               users#edit
#                     user GET    /users/:id(.:format)                                    users#show
#                          PATCH  /users/:id(.:format)                                    users#update
#                          PUT    /users/:id(.:format)                                    users#update
#                          DELETE /users/:id(.:format)                                    users#destroy
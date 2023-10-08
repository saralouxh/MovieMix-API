Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
 
  resources :playlists do
    member do
      get 'movies' # GET /playlists/:id/movies
      post 'add_movie' # POST /playlists/:id/add_movie
      delete 'remove_movie' # DELETE /playlists/:id/remove_movie
    end
  end

  resources :movies
end

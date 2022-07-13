Rottenpotatoes::Application.routes.draw do
  resources :movies do
    # part 2
    member do
      get 'similar', as: :find_similar
    end

  end
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')

  

end

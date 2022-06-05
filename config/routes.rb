Rails.application.routes.draw do
  
  devise_for :users
  root to: "books#index"
  resources :users
  resources :books 
  resources :categories
  resources :category2s
  resources :category3s
  resources :category4s
  resources :category5s
  resources :category6s
  resources :category7s
  get 'get_category/children', to: 'books#get_category_children', defaults: { format: 'json' }
  get 'get_category/grandchildren', to: 'books#get_category_grandchildren', defaults: { format: 'json' }
  get 'get_category2/children', to: 'books#get_category2_children', defaults: { format: 'json' }
  get 'get_category2/grandchildren', to: 'books#get_category2_grandchildren', defaults: { format: 'json' }
  get 'get_category3/children', to: 'books#get_category3_children', defaults: { format: 'json' }
  get 'get_category3/grandchildren', to: 'books#get_category3_grandchildren', defaults: { format: 'json' }
  get 'get_category4/children', to: 'books#get_category4_children', defaults: { format: 'json' }
  get 'get_category4/grandchildren', to: 'books#get_category4_grandchildren', defaults: { format: 'json' }
  get 'get_category5/children', to: 'books#get_category5_children', defaults: { format: 'json' }
  get 'get_category5/grandchildren', to: 'books#get_category5_grandchildren', defaults: { format: 'json' }
  get 'get_category6/children', to: 'books#get_category6_children', defaults: { format: 'json' }
  get 'get_category6/grandchildren', to: 'books#get_category6_grandchildren', defaults: { format: 'json' }
  get 'get_category7/children', to: 'books#get_category7_children', defaults: { format: 'json' }
  get 'get_category7/grandchildren', to: 'books#get_category7_grandchildren', defaults: { format: 'json' }
end

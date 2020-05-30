Rails.application.routes.draw do
 root 'home#top'
 get 'home/about' => 'home#about'
 devise_for :users, controllers: {
sessions: 'users/sessions',
registrations: 'users/registrations'
}

 resources :users, only:[:show, :edit, :update, :index]
 
 resources :books
  # get 'users/show'は＃マイページresourcesで定義したので削除
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
#マイページ
 
 
end
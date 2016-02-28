Rails.application.routes.draw do
  get 'user/index'

  post 'user' => 'user#test'
  get 'user/create/:username/:password/:firstname/:lastname' => 'user#create'
  get 'user/edit/:id/:longitude/:latitude', :to => "user#edit_location", :constraints => { :longitude => /.*/ , :latitude => /.*/}
  get 'user/login/:username/:password' => 'user#login'
  get 'user/index/:id' => 'user#index'
end

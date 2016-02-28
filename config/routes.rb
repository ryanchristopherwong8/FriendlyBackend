Rails.application.routes.draw do
  post 'user' => 'user#test'
  get 'user/create/:username/:password/:firstname/:lastname' => 'user#create'
  get 'user/edit/:username/:password/:longitude/:latitude', :to => "user#edit_location", :constraints => { :longitude => /.*/ , :latitude => /.*/}
  get 'user/login/:username/:password' => 'user#login'
  get 'user/logout/:username/:password' => 'user#logout'
  get 'user/index/:username/:password' => 'user#index'
  get 'user/near/:username/:password' => 'user#near'
  get 'user/test' => 'user#test'
end

Rails.application.routes.draw do
  resources :posts do
 	member do
 		put "like", to: "posts#upvote"
 	end
 end

 root "posts#index"
 
end
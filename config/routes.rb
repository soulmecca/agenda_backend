Rails.application.routes.draw do

	get 'agenda/all'
	
	namespace :api, constraints: { format: :json} do 
	  	get 'people' => 'agenda#all'
	end

end

class LandmarksController < ApplicationController
 
 get '/landmarks' do #READ: view all landmarks
  @landmarks = Landmark.all
  erb :'/landmarks/index'
 end
 
 get '/landmarks/new' do #CREATE: render new landmark form
  erb :'/landmarks/new'
 end
 
 post '/landmarks' do #CREATE: Instantiate new landmark
  @landmark = Landmark.create(params[:landmark])
  @landmark.save
  redirect to "/landmarks/#{@landmark.id}"
 end
 
 get '/landmarks/:id' do #READ: Shows specific landmark
  @landmark = Landmark.find_by_id(params[:id])
  erb :'/landmarks/show'
 end
 
 get '/landmarks/:id/edit' do #UPDATE: Renders landmark edit form
  @landmark = Landmark.find_by_id(params[:id])
  erb :'/landmarks/edit'
  end
  
  patch '/landmarks/:id' do #UPDATE: Updates Instance
  @landmark = Landmark.find_by_id(params[:id])
  @landmark.update(params[:landmark])
  @landmark.save
   redirect to "/landmarks/#{@landmark.id}"
  end
  
end

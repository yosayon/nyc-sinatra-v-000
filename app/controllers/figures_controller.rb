class FiguresController < ApplicationController
 
 get '/' do
  erb :'/application/root'
 end
 
 get '/figures' do #READ: view all figures
  @figures = Figure.all
  erb :'/figures/index'
 end
 
 get '/figures/new' do #CREATE: render new figure form
  erb :'/figures/new'
 end
 
 post '/figures' do #CREATE: instantiate new figure
 @figure = Figure.create(params[:figure])
 if !params[:title][:name].empty?
  @figure.titles << Title.create(params[:title])
 end
 if !params[:landmark][:name].empty?
  @figure.landmarks << Landmark.create(params[:landmark])
 end
 @figure.save
 redirect to "/figures/#{@figure.id}"
 end
 
 get '/figures/:id' do #READ: show specific figure (View done)
  @figure = Figure.find_by_id(params[:id])
  erb :'/figures/show'
 end
 
 get '/figures/:id/edit' do #UPDATE: render edit figure form
 @figure = Figure.find_by_id(params[:id])
 erb :'/figures/edit'
 end
 
 patch '/figures/:id' do #UPDATE: update figure
  @figure = Figure.find_by_id(params[:id])
  @figure.update(params[:figure])
  
  if !params[:title][:name].empty?
   @figure.titles << Title.create(params[:title])
  end
  if !params[:landmark][:name].empty?
   @figure.landmarks << Landmark.create(params[:landmark])
  end
  @figure.save
  redirect to "/figures/#{@figure.id}"
 end
 
end
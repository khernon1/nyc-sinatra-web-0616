class LandmarksController < ApplicationController
  #new, create, index, show, edit, update, delete
  
  #index
  get '/landmarks' do
    @landmarks = Landmark.all
    #binding.pry
    erb :'landmarks/index'
    #check the link to figure name
    #<p><%= landmark.figure.name %></p>
  end

  #new
  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  #create
  post '/landmarks' do
  #  binding.pry
    @landmark = Landmark.create(params[:landmark])
    redirect '/landmarks'
  end

  #show
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
    #add delete button
  end

  #edit
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  #edit action
  patch '/landmarks/:id/edit' do 
     landmark = Landmark.find(params[:id])
        landmark.update(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
     redirect "landmarks/#{landmark.id}"
  end

end

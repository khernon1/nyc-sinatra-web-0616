class FiguresController < ApplicationController
#new, show, index, create, edit, update, delete

  #index
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  #new
  get '/figures/new' do
    erb :'figures/new'
  end

  #create
  post '/figures' do    
    @figure = Figure.create(name: params[:figure][:name], title_ids: params[:figure][:title_ids], landmark_ids: params[:figure][:landmark_ids]) 
    #binding.pry
    if params[:title][:name] != ""
      title = Title.create(params[:title]) 
      @figure.titles << title
    end

    if params[:landmark][:name] != ""
      landmark = Landmark.create(params[:landmark]) 
      @figure.landmarks << landmark      
    end
      
    redirect '/figures'
  end

  #show
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  #edit
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    #binding.pry
    erb :'figures/edit'
  end

  #update
  patch '/figures/:id/edit' do
    figure = Figure.find(params[:id])
    
    if params[:figure][:title_ids] != ""
      title = Title.create(name: params[:figure][:title_ids]) 
      figure.titles << title
    end

    if params[:figure][:landmark_ids] != ""
      landmark = Landmark.create(name: params[:figure][:landmark_ids]) 
      figure.landmarks << landmark 
    end     
    figure.update(name: params[:figure][:name])
    redirect "/figures/#{figure.id}"
  end
end

    # <p> Landmark Name: <input id="figure_name" type="text" name="landmark[name]"></p>
    # <p> Title Name: <input id="figure_name" type="text" name="title[name]"></p>
    # <p> Figure Title: <input id="title_name" type="text" name="title[name]"></p>


    #  <p> Figure Title: <input id="new_title" type="text" name="figure_title"></p>

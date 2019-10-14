class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    id = params[:id]
    @recipe = Recipe.find_by(id: id)
    erb :show
  end

  get '/recipes/:id/edit' do
    id = params[:id]
    @recipe = Recipe.find_by(id: id)
    erb :edit
  end

  patch '/recipes/:id' do
    id = params[:id]
    @recipe=Recipe.find_by(id: id)
    redirect to "/recipes/#{recipe.id}"
  end

  delete '/recipes/:id' do
    id = params[:id]
    @recipe = Recipe.find_by(id: id)
    @recipe.delete
    redirect to '/recipes'
  end


end

class LandmarksController < ApplicationController
  get '/landmarks' do
      erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  post '/landmarks/:id' do
    landmark = Landmark.find(params[:id])
    landmark.update(params[:landmark])
    redirect "/landmarks/#{landmark.id}"
  end

  post '/landmarks' do
    landmark = Landmark.find_by(name: params[:landmark][:name])
    landmark ||= Landmark.create(params[:landmark])
    redirect '/landmarks'
  end
end

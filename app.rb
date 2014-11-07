require 'sinatra'
require 'sinatra/activerecord'
require './models'
require 'sinatra/flash'

set :database, 'sqlite3:formdemo.sqlite3'
enable :sessions

get "/" do
  if session[:user_id].nil?
    @user = nil
  else
    @user = User.find(session[:user_id])
  end

  erb :index
end

get '/homepage' do
  erb :homepage
end

post "/joinnow" do
  @user = User.new(params)
  @user.save
  redirect "/"
end


post "/login" do
  @user = User.where(email: params[:email]).first
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    flash[:notice] = "Great You got in!"
    redirect "/homepage"
  else
    flash[:notice] = "Invalid Attempt"
  end
  redirect "/"
end

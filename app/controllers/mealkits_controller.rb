class MealkitsController < ApplicationController

  get '/mealkits' do    #   get request, show action
    if logged_in?
      @customer = Customer.find(session[:customer_id])
      @mealkits = Mealkit.all
      erb :'/mealkits/mealkits'
    else
      redirect "/login"
    end
  end


  get '/mealkits/new' do     # get requst /new action
    if logged_in?
      @customer = current_customer
    erb :'/mealkits/new'
    else
      redirect "/login"
    end
  end

  post '/mealkits' do       #  post request /create new action
    if !params[:content].empty?
      mealkit = Mealkit.create(:name =>params[:name], :ingredients =>params[:ingredients], :customer_id =>params[:customer_id], :time =>params[:time], :serving_size =>params[:serving_size])
      @customer = current_customer
      @customer.mealkits << mealkit
      @customer.save
      redirect "/show"
    else
      redirect "/mealkits/new"
    end

  end

#  get '/edit' do
#    if logged_in?
#      @customer = Customer.find_by_id(session[:id])
  end

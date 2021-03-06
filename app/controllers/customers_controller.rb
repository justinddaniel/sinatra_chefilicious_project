require 'rack-flash'

class CustomersController < ApplicationController

  use Rack::Flash

  get '/signup' do      #  signup/get request/create action
    erb :'customers/signup'
  end

  post '/signup' do     #    signup/get request create action
    @customer = Customer.new(:name =>params[:name], :username =>params[:username], :email =>params[:email], :password =>params[:password])
    if @customer.save
      session[:customer_id] = @customer.id

      flash[:message] = "Thanks for signing up!"
      redirect to ("/main_menu")
    else
      flash[:message] = "Please sign up!"
      redirect to ("/signup")
   end
 end

  get '/login' do      #  login/get request/create action
    if logged_in?
      redirect "/main_menu"
    else
      erb :'/customers/login'
    end
  end

   post '/login' do     #    get request create action
     @customer = Customer.find_by(:username =>params[:username])
       if @customer && @customer.authenticate(params[:password])
         session[:customer_id] = @customer.id
           redirect "/main_menu"
       else
         flash[:message] = "Successfully Login!"
         redirect "/signup"
       end
   end

  get '/main_menu' do      #  show/get request show action
    erb :'/customers/main_menu'
  end

  get '/customers/logout' do
    session.destroy
    redirect '/login'
  end

  get '/customers/:id' do
    @customer = Customer.find(params[:id])
    erb :'customers/show'
  end

end

class SessionsController < ApplicationController
  
  def new
  end

  def create
  	user= User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
      flash[:success]= "Bienvenido a FlowOverStack"
  		redirect_to root_path
 	else	
      flash[:danger]= 'Email y/o contraseñas invalidas'
  		render 'new'
  	end	
  end

  def destroy
    log_out  if logged_in?
    redirect_to root_path
  end
  
end

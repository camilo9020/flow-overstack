class UsersController < ApplicationController
	
	def new
		@user=User.new
	end
	
	def create
		@user=User.new(user_params)
		if  @user.save
			log_in @user
			flash[:success]= "Bienvenido a FlowOverStack"
			redirect_to root_url
		else
			render 'new'
		end 
	end

	def edit
	end

	def show
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

end

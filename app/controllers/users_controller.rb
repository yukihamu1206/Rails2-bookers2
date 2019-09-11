class UsersController < ApplicationController

	before_action :authenticate_user!, only: [:edit, :update,:index, :show]
	before_action :correct_user, only: [:edit, :update]

	def show
		@user = User.find(params[:id])
		@books = @user.books .reverse_order
		@post_book = Book.new
	end

	def index
		@users = User.all
		@post_book = Book.new
		@user = User.find(current_user.id)
	end

	def edit
		@user = User.find(current_user.id)
	end


	def update
		@user = User.find(current_user.id)
    	if @user.update(user_params)
    	redirect_to "/users/#{@user.id}", notice: "You have updated successfully."
    	else
    	render :edit
		end
	end

	private

	def user_params
	    params.require(:user).permit(:name, :profile_image, :introduction)
	end

	def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user.id)
    end
  end



end
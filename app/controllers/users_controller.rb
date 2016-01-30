class UsersController < ApplicationController
  def index
  end

  def create
  end

	def create_a_user
		temp = User.new
		temp.name = params[:username]
		temp.email = params[:email]
		temp.number = params[:phone]

		if temp.save
			puts "The User was saved!"
      UserNotifier.send_signup_email(temp).deliver
			redirect_to root_path, flash: { notice: "The user was saved in the DB!" }
		else
			puts "Not saved!"
		end
	end

  def show
  end
end

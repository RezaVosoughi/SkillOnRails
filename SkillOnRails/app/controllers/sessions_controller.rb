class SessionsController < ApplicationController
  def new
  end
  
  def create
	user = User.find_by(username: params[:session][:username])
	puts params[:password]
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
	  puts "Logged in"
	  log_in user
      redirect_to '/overview'
    else
      # Create an error message.
		puts "Error logging in"
      redirect_to root_url, :notice => "Wrong username or password!"
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end

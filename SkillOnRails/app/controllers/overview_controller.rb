class OverviewController < ApplicationController
	before_action :logged_in_user
	
	def logged_in_user
      unless logged_in?
        redirect_to root_url
      end
    end
end

class ActivitiesController < ApplicationController

	def read_all
  		current_user.activities.where(read: false).update_all(read: true)
	end

	def notification
		render layout: false
	end

	private

	def activities_params
		params.require(:activities).permit(:read)
	end
end

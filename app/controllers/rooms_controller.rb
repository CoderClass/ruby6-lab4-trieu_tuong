class RoomsController < ApplicationController
	def create
		@room = Room.new(room_params)
		if @room.save
			flash[:success] = "Room was successfully created!"
			redirect_to root_path
		else
			flash[:error] = "Some thing wrong!"
			redirect_back fallback_location: root_path
		end	
	end


	private
		def room_params
			params.require(:room).permit(:name)
		end
end

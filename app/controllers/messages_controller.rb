class MessagesController < ApplicationController

	def index
		@room = Room.find(params[:room_id])
		@messages = @room.messages
	end


	def create
		@message = Message.new(message_params)
		@message.room_id = params[:room_id]
		if @message.save
			redirect_to room_messages_path(@message.room_id)
		else
			flash[:error] = "Errors: #{@message.errors.full_messages.to_sentence}"
			redirect_back fallback_location: room_messages_path(@message.room_id)
		end
	end

	private
	def message_params
		params.require(:message).permit(:content, :username)
	end
end

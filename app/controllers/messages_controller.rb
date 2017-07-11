class MessagesController < ApplicationController

	def index
		@room = Room.find(params[:room_id])
		@messages = @room.messages
		respond_to do |format|
			format.html
			format.js
			format.json{render json: @messages}
		end
	end


	def create
		@room = Room.find(params[:room_id])
		@message = @room.messages.build(message_params)
		@message.username = current_user
		@message.save!
		ActionCable.server.broadcast 'messages', message: render_message(@message)
		head :ok
	end

	private
	def message_params
		params.require(:message).permit(:content, :username)
	end

	def render_message(message)
		"<li> #{message.username}: #{message.content} </li>"
	end
end

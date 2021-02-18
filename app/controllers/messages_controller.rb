class MessagesController < ApplicationController

  def create
    message = Message.create(message_params)
    redirect_to "/guards/#{message.guard.id}"
  end
  
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, guard_id: params[:guard_id])
  end
end
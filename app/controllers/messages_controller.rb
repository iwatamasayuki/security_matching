class MessagesController < ApplicationController
  def new
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end
  
  def message_params
    @message = Message.new(text: params[:message][:text])
   end  
end

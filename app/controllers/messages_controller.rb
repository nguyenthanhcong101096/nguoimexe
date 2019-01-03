# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_message, only: %i[show]
  
  def index
    @conversation = Conversation.find(1)
  end
  
  def create
    message = current_user.messages.create(params_message)
    if message
      render json: { status: 'ok', message: 'create messages success' }
    else
      render json: { status: 'error', message: message.errors.messages }
    end
  end
  
  def show; end
  
  private
  
  def set_message
    @conversation = Conversation.find(params[:id])
  end
  
  def params_message
    params.require(:message).permit(:conversation_id, :msg)
  end
end

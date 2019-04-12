# frozen_string_literal: true

class Api::V1::MessagesController < Api::V1::BaseController
  before_action :set_conversation, only: %i[index]
  
  def index
    @messages   = @conversation.messages.where('id > ?', params[:min_id]).limit(15)
    html_blocks = @messages.each_with_object([]) { |message, arr| arr << render_to_string(partial: 'messages/message', formats: :html, locals: { message: message, user: current_user }) }
    render json: { comments: html_blocks, min_id: @messages.last.id }, status: :ok
  end
  
  def create
    conversation = Conversation.create(name: 'hohoho')
    [current_user.id, params_message[:target_id]].each { |usr_id| conversation.roomt_chats.create(sender_id: usr_id) }
    current_user.messages.create(params_message)
    render json: { message: 'ok' }
    
  end
  
  private

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end
  
  def params_message
    params.permit(:message, :attachment)
  end
end

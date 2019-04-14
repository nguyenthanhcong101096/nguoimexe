# frozen_string_literal: true

class Api::V1::MessagesController < Api::V1::BaseController
  before_action :set_conversation, only: %i[index]
  before_action :receiver, only: %i[create]

  def index
    @messages   = @conversation.messages.where('id > ?', params[:min_id]).limit(15)
    html_blocks = @messages.each_with_object([]) { |message, arr| arr << render_to_string(partial: 'messages/message', formats: :html, locals: { message: message, user: current_user }) }
    render json: { comments: html_blocks, min_id: @messages.last.id }, status: :ok
  end

  def create
    message = MessageService.new(params_message).create
    render json: { message: message, url: message_url(message.name) }, status: :ok
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def receiver
    @receiver = User.find(params[:receiver])
  end

  def params_message
    { sender: current_user, receiver: @receiver, message: params[:message] }
  end
end

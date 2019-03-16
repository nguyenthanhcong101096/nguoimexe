# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: %i[show]

  def index; end

  def new; end

  def create
    # Message.create(sender_id: 1, msg: params[:message][:msg], conversation_id: 1, attachment: params[:message][:attachment])
  end

  def show
    @message = @conversation.messages.new
  end

  private

  def set_message
    @conversation = Conversation.find_by!(name: params[:name])
    cookies.signed[:room_id] = @conversation.id
  end
end

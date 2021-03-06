# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: %i[show]

  def index
    @conversation = Conversation.first
    @messages = @conversation.messages.order(created_at: :desc).limit(20)
  end

  def new
    @conversation = Conversation.first
  end

  def create; end

  def show
    @messages = @conversation.messages.order(created_at: :desc).limit(20)
    @conversation.messages.read_message(current_user)
    @conversation.update(check: true)
  end

  private

  def set_message
    @conversation = current_user.conversations.find_by!(name: params[:name])
    cookies.signed[:room_id] = @conversation.id
  end
end

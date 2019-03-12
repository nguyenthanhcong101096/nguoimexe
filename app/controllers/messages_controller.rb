# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: %i[show]

  def index
    
  end

  def new; end

  def show
    redirect_to messages_path unless @check
  end

  private

  def set_message
    @check = current_user.conversation_ids.include?(params[:id].to_i)
    @conversation = Conversation.find(params[:id])
  end
end

# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_message, only: %i[show]
  
  def index
    @conversation = Conversation.find(1)
  end
  
  def show; end
  
  private
  
  def set_message
    @conversation = Conversation.find(params[:id])
  end
end

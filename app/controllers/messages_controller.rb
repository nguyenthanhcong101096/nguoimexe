# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_message, only: %i[show]
  
  def index
    @conversations = Conversation.all
  end
  
  def show
    @conversations = Conversation.all
  end
  
  private
  
  def set_message
    @conversation = Conversation.find(params[:id])
  end
end

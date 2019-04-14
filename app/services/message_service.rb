# frozen_string_literal: true

class MessageService
  def initialize(params)
    @sender    = params[:sender]
    @receiver  = params[:receiver]
    @message   = params[:message]
  end

  def create
    has_room_chat[:room] ? create_message : create_room
  end

  def create_message
    @sender.messages.create(msg: @message, conversation_id: has_room_chat[:conversation])
  end

  def create_room
    ActiveRecord::Base.transaction do
      name_conversation = (0...100).map { rand(65..90).chr }.join
      conversation = Conversation.create(name: name_conversation)
      [@sender, @receiver].each { |user| conversation.room_chats.create(sender: user) }
      @message = @sender.messages.create(msg: @message, conversation: conversation)
    end
  end

  private

  def has_room_chat
    has_room = @sender.conversations & @receiver.conversations
    return { conversation: has_room.first.id, room: true } if has_room.present?

    {}
  end
end

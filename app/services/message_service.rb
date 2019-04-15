# frozen_string_literal: true

class MessageService
  def initialize(current_user, params)
    @sender    = current_user
    @params    = params
  end

  def create
    if receivers.count > 1
      create_room
    else
      has_room_chat[:room] ? create_message : create_room
    end
  end

  def create_message
    @sender.messages.create(params_message.merge(conversation_id: has_room_chat[:conversation]))
  end

  def create_room
    ActiveRecord::Base.transaction do
      conversation = Conversation.create(params_conversation)
      [@sender, receivers].flatten.each { |user| conversation.room_chats.create(sender: user) }
      @sender.messages.create(params_message.merge(conversation: conversation))
    end
  end

  private
    
  def has_room_chat
    has_room = @sender.conversations & receivers[0].conversations
    return { conversation: has_room.first.id, room: true } if has_room.present?

    {}
  end
  
  def receivers
    User.where(id: @params[:receivers])
  end
  
  def params_message
    @params.permit(:msg, :attachment)
  end
  
  def params_conversation
    @params.permit(:name_conversation).merge(name: (0...100).map { rand(65..90).chr }.join)
  end
end

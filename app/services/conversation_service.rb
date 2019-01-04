# frozen_string_literal: true

class ConversationService
  def initialize(current_user, params)
    @current_user = current_user
    @params = params
  end

  def excute!; end

  private

  def conversation_exists?; end
end

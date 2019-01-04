# frozen_string_literal: true

class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations, &:timestamps
  end
end

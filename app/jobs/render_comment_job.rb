class RenderCommentJob < ApplicationJob
  queue_as :default

  def perform(comment)
    ActionCable.server.broadcast 'comments_channel', html: render_new_comment(comment)
  end
  
  private
  
  def render_new_comment(comment)
    ApplicationController.renderer.render(partial: 'posts/comment', locals: { comment: comment })
  end
end

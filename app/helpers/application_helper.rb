# frozen_string_literal: true

module ApplicationHelper
  def inline_svg(name)
    file = File.open("app/javascript/images/#{name}", 'rb')
    raw file.read
  end

  def social_share(post)
    post_url = posts_url(slug: post.slug_title)
    link_to(inline_svg('ico_share.svg'), "https://www.facebook.com/sharer/sharer.php?u=#{u posts_url.concat("/#{post.slug_title}")}&caption=#{u post.title}", class: 'js-btn-share-sns')
  end
end

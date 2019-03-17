# frozen_string_literal: true

module ApplicationHelper
  def inline_svg(name)
    file = File.open("app/javascript/images/#{name}", 'rb')
    raw file.read
  end
end

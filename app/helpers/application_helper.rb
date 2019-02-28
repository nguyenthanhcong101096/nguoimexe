# frozen_string_literal: true

module ApplicationHelper
  def error_message(obj, key)
    return if obj.errors.blank?

    if key.is_a?(Array)
      key.map { |k| content_tag(:p, obj.errors.full_messages_for(k).first, class: 'form-input-hint') if obj.errors.messages[k].present? }.compact.first
    elsif obj.errors.present? && obj.errors.messages[key]
      content_tag(:p, obj.errors.full_messages_for(key).first, class: 'form-input-hint')
    end
  end
  
  def inline_svg(name)
    file = File.open("app/javascript/images/#{name}", "rb")
    raw file.read
  end
end

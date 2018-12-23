module ApplicationHelper
  def error_message(obj, key)
    return if obj.errors.blank?
    if key.is_a?(Array)
      key.map { |k| content_tag(:p, obj.errors.full_messages_for(k).first, class: 'form-input-hint') if obj.errors.messages[k].present? }.compact.first
    elsif obj.errors.present? && obj.errors.messages[key]
      content_tag(:p, obj.errors.full_messages_for(key).first, class: 'form-input-hint')
    end
  end
  
  def switch_language(language)
    case language
    when :en
      text, img, locale = ['Vietnamese', 'images/img_flag_vn.png', :vi]
    when :vi
      text, img, locale = ['England', 'images/img_flag_en.png', :en]
    end
    
    content_tag(:a, class: 'horizontal btn js-language-switcher', locale: url_for(locale: locale)) do
      image_tag(asset_pack_path(img), class: 'avatar-header mr-8') + 
      content_tag(:p, text, class: 'menu')
    end
  end
end

# frozen_string_literal: true

module CheckKeyWord
  extend ActiveSupport::Concern

  def forbidden_words(words)
    error = []
    words = words.downcase
    keys  = JSON.parse(File.read('settings.json'))

    keys['forbidden-words'].each do |key|
      check = words.include?(key)
      check ? error << key : ''
    end

    if error.any?
      { message: "Nội dung chứa các từ thô tục : #{error.join(' - ')}", status: false }
    else
      { message: 'check success', status: true }
    end
  end
end

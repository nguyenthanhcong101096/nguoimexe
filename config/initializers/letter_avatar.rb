# frozen_string_literal: true

module LetterAvatar
  module Colors
    IWANTHUE = [
      [255, 110, 127],
      [0, 200, 151],
      [112, 157, 255],
      [177, 112, 255],
      [197, 0, 23],
      [94, 80, 179],
      [218, 151, 116],
      [0, 184, 205],
      [234, 172, 65],
      [255, 148, 190]
    ].freeze

    def self.iwanthue
      IWANTHUE
    end
  end
end

LetterAvatar.setup do |config|
  config.fill_color        = 'rgba(255, 255, 255, 1)'
  config.cache_base_path   = 'public/uploads/lets'
  config.weight            = 300
  config.annotate_position = '-0+10'
  config.letters_count     = 1
  config.pointsize         = 140
  config.colors_palette    = :iwanthue
end

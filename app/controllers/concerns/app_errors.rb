# frozen_string_literal: true

class AppErrors
  extend ActiveSupport::Concern

  class Error409 < StandardError; end
end

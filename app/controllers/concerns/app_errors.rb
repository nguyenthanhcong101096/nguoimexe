# frozen_string_literal: true

class AppErrors
  extend ActiveSupport::Concern

  class Error403 < StandardError; end
  class Error409 < StandardError; end
end

# frozen_string_literal: true

class SubdomainStore
  def self.matches?(request)
    request.subdomain.present? && request.subdomain == 'stores'
  end
end

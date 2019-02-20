# frozen_string_literal: true

class SubdomainAdmin
  def self.matches?(request)
    request.subdomain.present? && request.subdomain == 'admin' 
  end
end

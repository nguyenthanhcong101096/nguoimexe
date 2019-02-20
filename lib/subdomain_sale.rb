# frozen_string_literal: true

class SubdomainSale
  def self.matches?(request)
    request.subdomain.present? && request.subdomain == 'sale'
  end
end

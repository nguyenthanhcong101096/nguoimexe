# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
           '940492105837-g0qkk5hieu1ede677i5pceack1kttbmp.apps.googleusercontent.com',
           'GczD38ybLyfNHKvXNkmYvkEk',
           scope: 'email'
end

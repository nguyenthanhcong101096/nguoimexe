# frozen_string_literal: true

SitemapGenerator::Sitemap.default_host = 'https://nguoimexe.com'
SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do
  add root_path, priority: 0.8
end

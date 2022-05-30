require "open-uri"

class FetchFaviconJob < ApplicationJob
  queue_as :default

  def perform(bookmark)
    uri = URI.parse(bookmark.url)

    doc = Nokogiri::HTML(URI.open(uri))

    favicon_url = doc.css('link[rel="shortcut icon"]').first["href"] rescue nil

    if favicon_url.nil?
      favicon_url = URI.join(uri, "/favicon.ico").to_s
    else
      favicon_url = URI.join(uri, favicon_url).to_s
    end

    io = URI.open(favicon_url)

    bookmark.favicon.attach(io: io, filename: URI.parse(favicon_url).path.split("/").last)
  end
end

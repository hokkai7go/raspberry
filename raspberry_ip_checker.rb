# --- coding: utf-8

require "open-uri"
require "nokogiri"

url = "http://www.cman.jp/network/support/go_access.cgi"

charset = nil
html = open(url) do |f|
  charset = f.charset
  f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)
p doc.xpath("//input").last.attributes.fetch("value").text

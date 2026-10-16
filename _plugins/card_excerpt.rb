# Two-sentence excerpt for post cards (blog index, topic hubs, author pages).
# Uses the post's `summary` front matter if set (editable in the CMS); otherwise takes the first
# two sentences of the first real paragraph of the article (skipping images, captions, short lines).
require 'cgi'

module CardExcerpt
  MIN_PARAGRAPH = 60   # characters; shorter paragraphs are usually captions or labels
  MAX_LENGTH    = 280  # characters; keeps cards even when sentences run long

  def self.text_of(html)
    text = html.gsub(%r{<br\s*/?>}i, ' ').gsub(/<[^>]+>/, '')
    CGI.unescapeHTML(text).gsub(/\s+/, ' ').gsub(/\s+([.,!?;:])/, '\\1').strip
  end

  def self.first_two_sentences(text)
    sentences = text.split(/(?<=[.!?])\s+(?=["“'(\[]?[A-Z0-9])/)
    out = sentences.first(2).join(' ')
    out = out[0, MAX_LENGTH].sub(/\s+\S*\z/, '') + '…' if out.length > MAX_LENGTH
    out
  end

  def self.build(doc)
    summary = doc.data['summary'].to_s.strip
    return summary unless summary.empty?
    html = doc.content.to_s
    # leave out tables of contents, quick-link boxes and quotes before looking for the intro
    html = html.gsub(%r{<(nav|blockquote|table|pre)\b.*?</\1>}m, ' ').gsub(%r{<ul id="markdown-toc".*?</ul>}m, ' ')
    html.scan(%r{<p\b[^>]*>(.*?)</p>}m) do |(inner)|
      text = text_of(inner)
      next if text.length < MIN_PARAGRAPH
      return first_two_sentences(text)
    end
    doc.data['description'].to_s.strip
  end
end

# Runs after each post is converted to HTML (post.content). Posts are rendered before pages,
# so the index and topic pages can read card_excerpt.
Jekyll::Hooks.register :posts, :post_render do |post|
  post.data['card_excerpt'] = CardExcerpt.build(post)
end

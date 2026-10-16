# jekyll-seo-tag always prints its own JSON-LD. On posts, author pages and topic hubs we print
# richer structured data ourselves (_includes/schema-*.html), so remove the plugin's block there
# to avoid two competing BlogPosting/WebPage entities. Its meta tags (title, description,
# canonical, Open Graph, Twitter) are kept.
module StripSeoJsonLd
  SEO_BLOCK = /(<!-- Begin Jekyll SEO tag.*?)<script type="application\/ld\+json">.*?<\/script>(.*?<!-- End Jekyll SEO tag -->)/m

  def self.strip(item)
    return unless item.output
    layout = item.data['layout']
    return unless %w[post author hub].include?(layout)
    item.output = item.output.sub(SEO_BLOCK, '\1\2')
  end
end

Jekyll::Hooks.register [:posts, :pages, :documents], :post_render do |item|
  StripSeoJsonLd.strip(item)
end

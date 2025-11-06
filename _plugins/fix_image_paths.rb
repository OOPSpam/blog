Jekyll::Hooks.register :posts, :pre_render do |post|
  # Fix image paths that start with /blog/ when baseurl is already /blog
  if post.data['image'] && post.data['image'].start_with?('/blog/')
    post.data['image'] = post.data['image'].sub('/blog/', '/')
  end
end

Jekyll::Hooks.register :pages, :pre_render do |page|
  # Fix image paths that start with /blog/ when baseurl is already /blog
  if page.data['image'] && page.data['image'].start_with?('/blog/')
    page.data['image'] = page.data['image'].sub('/blog/', '/')
  end
end
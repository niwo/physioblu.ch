
activate :i18n, mount_at_root: false # :de

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false


after_build do |builder|
  src = File.join(File.dirname(__FILE__), "_redirects")
  dst = File.join(config[:build_dir], "_redirects")
  builder.thor.source_paths << File.dirname(__FILE__)
  builder.thor.copy_file(src, dst)
end


helpers do
  #use frontmatter for I18n titles
  def page_title(page)
    if page.data.title.is_a?(Hash) && page.data.title[I18n.locale]
      return "#{page.data.title.send(I18n.locale)} - PhysioBlu"
    elsif page.data.title
      return "#{page.data.title} - PhysioBlu"
    else
      nil
    end
  end
end
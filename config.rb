
activate :i18n, mount_at_root: false

I18n.available_locales = [:de]

# Generate Services Detail Pages
@app.data.team.each do |member|
  I18n.available_locales.each do |lang| 
    proxy(
      "/#{lang}/team/#{member.first_name.downcase}/index.html",
      "localizable/team/member.html",
      locals: { member: member },
      ignore: true
    )
  end
end

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
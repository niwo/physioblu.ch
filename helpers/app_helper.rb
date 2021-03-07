module AppHelper

  #use frontmatter for I18n titles
  def self.page_title(page)
    if page.data.title_translation_key
      "#{I18n.t(page.data.title_translation_key)} - PhysioBlu"
    elsif page.data.title
      "#{page.data.title} - PhysioBlu"
    else
      nil
    end
  end

  def self.page_reference(page)
    ref = page.source_file.gsub(/.*localizable/, "")
    ref.gsub(".erb", "") 
  end

end
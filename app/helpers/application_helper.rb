module ApplicationHelper
  def full_title(page_title)
    base_tilte = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_tilte
    else
      "#{base_tilte} | #{page_title}"
    end
  end
end

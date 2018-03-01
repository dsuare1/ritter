module ApplicationHelper

  # returns fll title on a per-page basis
  def full_title(page_title = '')
    base_title = 'Ritter'

    if page_title.empty?
      base_title
    else
      page_title + ' :: ' + base_title
    end
  end
end

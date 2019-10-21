module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << '资料管理').join(' - ')
      end
    end
  end

  def admins_only
    yield if current_user.try(:admin?)
  end

  def findbook(id)
    @book = Book.find_by id: id
  end

  def full_title(page_title = '')
    base_title = t('app_name')
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def book_sort_params
    [[(t 'categories.show.created_at'), 'created_at'],
     [(t 'categories.show.title'), 'title'],
     [(t 'categories.show.public_date'), 'public_date']]
  end

  # TODO: markdown
  # def markdown(_content)
  #   options = {
  #     autolink: true,
  #     no_intra_emphasis: true,
  #     disable_indented_code_blocks: true,
  #     fenced_code_blocks: true,
  #     lax_html_blocks: true,
  #     strikethrough: true,
  #     superscript: true,
  #     quote: true,
  #     hightlight: true,
  #     tables: true,
  #     emoji: true
  #   }
  #
  #   RedCarpet::Markdown.new(Redcarpet::Render::HTML, options).render content
  # end
end

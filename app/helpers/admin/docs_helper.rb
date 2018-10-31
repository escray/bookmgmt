module Admin::DocsHelper
  def doc_filters(options)
    params.permit(:status, :journal_id).merge(options)
  end
end

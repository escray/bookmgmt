#
class ItemsController < ApplicationController
  before_action :set_doc

  def new
    @item = @journal.items.new
  end

  private

  def set_doc
    @journal = Journal.find(params[:doc_id])
  end
end

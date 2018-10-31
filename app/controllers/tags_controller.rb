class TagsController < ApplicationController
  def remove
    @doc = Doc.find(params[:doc_id])
    @tag = Tag.find(params[:id])
    authorize @doc, :tag?
    @doc.tags.destroy(@tag)
    head :ok
  end
end

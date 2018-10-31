class CommentsController < ApplicationController
  before_action :set_doc

  def create
    @comment = @doc.comments.build(sanitized_parameters)
    @comment.author = current_user
    authorize @comment, :create?

    if @comment.save
      flash[:notice] = '评论已添加'
      redirect_to [@doc.journal, @doc]
    else
      flash.now[:notice] = '评论未添加'
      @journal = @doc.journal
      render 'docs/show'
    end
  end

  private

  def set_doc
    @doc = Doc.find(params[:doc_id])
  end

  def comment_params
    params.require(:comment).permit(:text, :state_id, :tag_names)
  end

  def sanitized_parameters
    whitelisted_params = comment_params
    whitelisted_params.delete(:state_id) unless policy(@doc).change_state?
    whitelisted_params.delete(:tag_names) unless policy(@doc).tag?
    whitelisted_params
  end
end

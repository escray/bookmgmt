#
class Admin::CsvImportsController < ApplicationController
  skip_after_action :verify_authorized, :verify_policy_scoped
  # before_action :require_editor!
  def index
    @imports = CsvImport.all.order('id DESC')
  end

  def create
    @import = CsvImport.new(csv_import_params)
    @import.status = 'pending'
    @import.user = current_user

    if @import.save
      @import.process!
      flash[:notice] = '汇入完成'
    end

    redirect_to admin_csv_imports_path
  end

  protected

  def csv_import_params
    params.require(:csv_import).permit(:csv_file)
  end
end

class Admin::CsvExportsController < ApplicationController
  skip_after_action :verify_authorized, :verify_policy_scoped

  def index
    @exports = CsvExport.all.order('id DESC')
  end

  def create
    @export = CsvExport.new(csv_export_params)
    @export.status = 'pending'
    @export.user = current_user

    if @export.save
      @export.process!
      flash[:notice] = '汇出完成'
    end

    redirect_to admin_csv_exports_path
  end

  protected

  def csv_export_params
    params.require(:csv_export).permit(:csv_file)
  end
end

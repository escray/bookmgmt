class ImportWorkerJob < ApplicationJob
  queue_as :default

  def perform(import_id)
    import = CsvImport.find(import_id)
    import.process!
  end
end

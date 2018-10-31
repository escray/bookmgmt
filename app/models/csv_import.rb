require 'csv'
class CsvImport < ApplicationRecord
  mount_uploader :csv_file, CsvImportUploader

  validates_presence_of :csv_file

  belongs_to :user

  serialize :error_message, JSON

  def process!
    csv_string = csv_file.read.force_encoding('utf-8')

    success = 0
    failed_records = []

    CSV.parse(csv_string) do |row|
      doc = Doc.new(name: row[0],
                    journal: Journal.find(row[1]),
                    description: row[2],
                    publish: row[3],
                    receive: row[4],
                    amount: row[5],
                    status: row[6],
                    origin: row[7],
                    editor_id: row[8],
                    level: row[9])
      if doc.save
        success += 1
      else
        failed_records << [row, doc.errors.full_messages]
      end
    end

    self.status = 'imported'
    self.import_type = 'doc'
    self.success_count = success
    self.total_count = success + failed_records.size
    self.error_message = failed_records

    save!
  end
end

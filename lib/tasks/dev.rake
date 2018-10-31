require 'csv'
namespace :dev do
  task add_items_to_doc: :environment do
    success = 0
    docs = Doc.all
    default_unit = Department.find(8)
    docs.each do |doc|
      doc.items = []
      i = 1
      doc.amount = doc.departments.count
      doc.departments.each do |dept|
        item = Item.new
        item.owner = dept.name
        item.doc_id = doc.id
        item.name = doc.id.to_s + '-' + i.to_s
        doc.items.append(item)
        i += 1
      end
      doc.save
      success += 1
    end
  end


  task import_docs_csv_file: :environment do
    success = 0
    failed_records = []

    CSV.foreach("#{Rails.root}/tmp/docs.csv") do |row|
      doc = Doc.new(name: row[0],
                    # journal_id: row[1],
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
        failed_records << [row, doc]
      end
    end

    puts "总共汇入 #{success} 笔，失败 #{failed_records.size} 笔"

    failed_records.each do |record|
      puts "#{record[0]} ---> #{record[1].errors.full_messages}"
    end
  end

  task import_journals_csv_file: :environment do
    success = 0
    failed_records = []

    CSV.foreach("#{Rails.root}/tmp/journals.csv") do |row|
      journal = Journal.new(id: row[0],
                            name: row[1],
                            shortname: row[2],
                            publisher: row[3],
                            interval: row[4],
                            amount: row[5],
                            delivery: row[6],
                            description: row[7])
      if journal.save
        success += 1
      else
        failed_records << [row, journal]
      end
    end

    puts "总共汇入 #{success} 笔，失败 #{failed_records.size} 笔"

    failed_records.each do |record|
      puts "#{record[0]} ---> #{record[1].errors.full_messages}"
    end
  end
end

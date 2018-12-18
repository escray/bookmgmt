class CreateMagazines < ActiveRecord::Migration[5.2]
  def change
    create_table :magazines do |t|
      t.string :title, null: false
      t.string :management
      t.string :subheading
      t.string :editor
      t.string :publisher
      t.string :pub_addr
      t.string :language, default: '中文'
      t.string :original_name
      t.string :created_year
      t.string :post_num
      t.string :cn_num
      t.string :issn
      t.string :pub_cycle
      t.string :pub_period
      t.integer :year_issue
      t.decimal :per_price
      t.decimal :year_price
      t.integer :page
      t.string :format
      t.string :source, default: '邮局订阅'
      t.boolean :subscribe, default: true
      t.integer :copy, default: 1
      t.string :image
      t.string :description
      t.string :status
      t.string :status_remark
      t.timestamps
    end
  end
end

class CreateCrawlers < ActiveRecord::Migration
  def change
    create_table :crawlers do |t|
      t.string :url, null: false
      t.text :h1_content
      t.text :h2_content
      t.text :h3_content
      t.text :link_content
      t.text :term

      t.timestamps null: false
    end
  end
end

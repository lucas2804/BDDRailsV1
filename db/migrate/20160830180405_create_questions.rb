class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name, null: false
      t.text :description
      t.references :test
      t.timestamps
    end
  end
end

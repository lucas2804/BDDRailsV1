class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :name, null: false
      t.boolean :is_correct_answer, default: false
      t.text :description
      t.references :question
      t.timestamps null: false
    end
  end
end

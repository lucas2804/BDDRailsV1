class CreateTestResults < ActiveRecord::Migration
  def change
    create_table :test_results do |t|
      t.references :question
      t.references :answer
      t.references :test
      t.references :user

      t.timestamps null: false
    end
  end
end

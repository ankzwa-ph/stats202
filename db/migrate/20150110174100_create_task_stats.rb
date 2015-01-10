class CreateTaskStats < ActiveRecord::Migration
  def change
    create_table :task_stats do |t|
      t.integer :open, null: false
      t.integer :in_progress, null: false
      t.integer :resolved, null: false
      t.integer :closed, null: false
      t.integer :total, null: false
      t.date :processing_date, null: false

      t.timestamps null: false
    end
  end
end

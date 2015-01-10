class CreateTaskStats < ActiveRecord::Migration
  def change
    create_table :task_stats do |t|
      t.integer :open
      t.integer :in_progress
      t.integer :resolved
      t.integer :closed
      t.integer :total
      t.date :processing_date

      t.timestamps null: false
    end
  end
end

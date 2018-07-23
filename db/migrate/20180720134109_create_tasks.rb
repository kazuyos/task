class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :task
      t.text :description
      t.boolean :status
      t.integer :require
      t.date :deadline

      t.timestamps null: false
    end
  end
end

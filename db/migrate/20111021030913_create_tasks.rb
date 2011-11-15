class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :folder_id
      t.string :name
      t.date :due

      t.timestamps
    end
  end
end

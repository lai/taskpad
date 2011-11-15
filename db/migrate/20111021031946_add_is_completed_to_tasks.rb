class AddIsCompletedToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :is_completed, :boolean    
  end

  def self.down
    remove_column :tasks, :is_completed
  end
end

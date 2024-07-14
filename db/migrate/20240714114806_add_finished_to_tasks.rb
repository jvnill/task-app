class AddFinishedToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :finished, :boolean
  end
end

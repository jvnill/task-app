class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :subtitle
      t.datetime :due_date
      t.string :priority

      t.timestamps
    end
  end
end

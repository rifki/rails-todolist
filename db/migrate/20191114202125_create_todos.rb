class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :name
      t.integer :user_id
      t.text :description
      t.datetime :due_date
      t.integer :priority
      t.boolean :is_completed
      t.datetime :completed_at

      t.timestamps
    end
  end
end

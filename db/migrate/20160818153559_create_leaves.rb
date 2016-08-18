class CreateLeaves < ActiveRecord::Migration[5.0]
  def change
    create_table :leaves do |t|

      t.datetime :leave_time_start
      t.datetime :leave_time_end
      t.string :leave_class
      t.string :leave_subject
      t.integer :user_id

      t.timestamps
    end

    add_index :leaves, :user_id
  end
end

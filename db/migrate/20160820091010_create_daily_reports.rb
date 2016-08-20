class CreateDailyReports < ActiveRecord::Migration[5.0]
  def change
    create_table :daily_reports do |t|

      t.string :content
      t.date :daily
      t.integer :user_id ,index: true

      t.timestamps
    end
  end
end

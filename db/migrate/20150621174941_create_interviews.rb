class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.integer :job_id
      t.string :title
      t.integer :number
      t.string :type
      t.string :details
      t.date :date
      t.string :time_between
      t.string  :questions
      t.timestamps null: false
    end
  end
end

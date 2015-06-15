class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :company_id
      t.string :title
      t.string :job_description
      t.timestamps null: false
    end
  end
end

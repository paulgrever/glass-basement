class CreateCompanyRegions < ActiveRecord::Migration
  def change
    create_table :company_regions do |t|
      t.integer :company_id
      t.integer :region_id
      t.timestamps null: false
    end
  end
end

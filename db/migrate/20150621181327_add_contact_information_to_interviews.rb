class AddContactInformationToInterviews < ActiveRecord::Migration
  def change
    add_column :interviews, :interviewer_name, :string
    add_column :interviews, :interviewer_email, :string
    add_column :interviews, :interviewer_phone, :string
  end
end

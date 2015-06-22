class ChangeColumnTypeToInterviewType < ActiveRecord::Migration
  def change
    rename_column :interviews, :type, :interview_type
  end
end

class CreateJoinTableInterviewContact < ActiveRecord::Migration[7.0]
  def change
    create_join_table :interviews, :contacts do |t|
      # t.index [:interview_id, :contact_id]
      # t.index [:contact_id, :interview_id]
    end
  end
end

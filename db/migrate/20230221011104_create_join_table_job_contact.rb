class CreateJoinTableJobContact < ActiveRecord::Migration[7.0]
  def change
    create_join_table :jobs, :contacts do |t|
      t.index [:job_id, :contact_id]
      t.index [:contact_id, :job_id]
    end
  end
end

class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :job_title
      t.string :job_board_link
      t.datetime :application_date
      t.text :job_description
      t.integer :job_position_type
      t.integer :job_pay_type
      t.integer :job_application_status

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateRequestedJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :requested_jobs do |t|
      t.integer :emp_id
      t.integer :job_id
      t.integer :company_id

      t.timestamps
    end
  end
end

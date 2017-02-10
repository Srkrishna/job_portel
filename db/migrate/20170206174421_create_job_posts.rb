class CreateJobPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :job_posts do |t|
      t.integer :company_id
      t.string :required_on
      t.integer :etc
      t.text :description

      t.timestamps
    end
  end
end

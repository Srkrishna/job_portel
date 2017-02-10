class CreateExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :experiences do |t|
      t.integer :member_id
      t.string :company_name
      t.string :worked_as
      t.text :description
      t.string :experience

      t.timestamps
    end
  end
end

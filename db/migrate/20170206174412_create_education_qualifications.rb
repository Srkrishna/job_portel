class CreateEducationQualifications < ActiveRecord::Migration[5.0]
  def change
    create_table :education_qualifications do |t|
      t.integer :member_id
      t.string :intitution_name
      t.string :passed_out
      t.integer :percentage

      t.timestamps
    end
  end
end

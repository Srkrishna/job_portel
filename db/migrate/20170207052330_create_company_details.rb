class CreateCompanyDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :company_details do |t|
      t.string :name
      t.text :address
      t.string :keyword
      t.text :description
      t.string :url
      t.integer :member_id

      t.timestamps
    end
  end
end

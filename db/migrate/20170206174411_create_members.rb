class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :phone
      t.string :email
      t.string :photo
      t.string :role
      t.string :resume
      t.string :locations
      t.string :links
      t.text :description
      t.string :father_name
      t.integer :user_id
      t.boolean :has_company

      t.timestamps
    end
  end
end

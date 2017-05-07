class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :firstname
      t.string :lastname
      t.string :role
      t.string :phonenumber
      t.string :email
      t.string :linkedin
      t.string :website

      t.timestamps
    end
  end
end

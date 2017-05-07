class CreateExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :experiences do |t|
      t.string :role
      t.string :company
      t.text :description
      t.date :startdate
      t.date :enddate

      t.timestamps
    end
  end
end

class CreateCareerApplications < ActiveRecord::Migration
  def change
    create_table :career_applications do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.text :cover_letter

      t.timestamps
    end
    add_attachment :career_applications, :resume
  end
end

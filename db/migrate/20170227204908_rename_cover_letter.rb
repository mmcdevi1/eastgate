class RenameCoverLetter < ActiveRecord::Migration
  def change
    rename_column :career_applications, :cover_letter, :old_cover_letter
  end
end

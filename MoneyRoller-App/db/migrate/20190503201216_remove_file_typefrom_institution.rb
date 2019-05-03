class RemoveFileTypefromInstitution < ActiveRecord::Migration[5.2]
  def change
    remove_column :institutions, :file_type, :string
  end
end

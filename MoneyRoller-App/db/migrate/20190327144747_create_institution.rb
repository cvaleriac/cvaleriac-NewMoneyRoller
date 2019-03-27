class CreateInstitution < ActiveRecord::Migration[5.2]
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :address
      t.string :file_type

      t.timestamps null: false
    end
  end
end

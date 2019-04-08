class CreateRolloverinstitution < ActiveRecord::Migration[5.2]
  def change
    create_table :rolloverinstitutions do |t|
      t.belongs_to :rollover, index: true, foreign_key: true
      t.belongs_to :institution, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end

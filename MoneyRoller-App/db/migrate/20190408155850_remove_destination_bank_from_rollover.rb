class RemoveDestinationBankFromRollover < ActiveRecord::Migration[5.2]
  def change
    remove_column :rollovers, :destination_bank, :string
  end
end

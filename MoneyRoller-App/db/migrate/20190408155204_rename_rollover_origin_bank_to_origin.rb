class RenameRolloverOriginBankToOrigin < ActiveRecord::Migration[5.2]
  def change
    rename_column :rollovers, :origin_bank, :origin
  end
end

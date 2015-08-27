class AddMatchedToBatch < ActiveRecord::Migration
  def change
    add_column :batches, :matched, :integer
  end
end

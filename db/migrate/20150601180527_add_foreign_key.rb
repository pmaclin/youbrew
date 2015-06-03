class AddForeignKey < ActiveRecord::Migration
  def change
    add_foreign_key(:uniques, :users)
  end
end

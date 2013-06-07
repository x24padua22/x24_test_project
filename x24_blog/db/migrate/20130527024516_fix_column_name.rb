class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :blogs, :name, :title
  end
end

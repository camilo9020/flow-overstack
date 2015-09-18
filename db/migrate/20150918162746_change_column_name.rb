class ChangeColumnName < ActiveRecord::Migration
  def change

  	rename_column :questions, :content, :title

  end
end

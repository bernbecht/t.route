class ChangeColumnNullCompany < ActiveRecord::Migration
  def change
  	change_column_null :companies, :name, false
  end
end

class RenameTableDepartamento < ActiveRecord::Migration[5.0]
  def change
    rename_table :departamentos, :groups
    rename_column :groups, :nome, :name
  end
end

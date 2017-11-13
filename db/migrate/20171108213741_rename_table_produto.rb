class RenameTableProduto < ActiveRecord::Migration[5.0]
  def change
    rename_table :produtos, :contacts
    rename_column :contacts, :nome, :name
    rename_column :contacts, :descricao, :telephone
    rename_column :contacts, :quantidade, :email
    rename_column :contacts, :departamento_id, :group_id
    change_column :contacts, :email, :string
    remove_column :contacts, :preco
  end
end

class AddEnderecoAndProfissaoToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :endereco, :string
    add_column :customers, :profissao, :string
  end
end

class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.string :dispositivo
      t.string :price

      t.timestamps
    end
  end
end

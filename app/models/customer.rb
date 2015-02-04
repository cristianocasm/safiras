class Customer < ActiveRecord::Base
  validates_presence_of :nome, :email, :telefone, :profissao, :endereco
end

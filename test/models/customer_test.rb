require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  should validate_presence_of(:nome)
  should validate_presence_of(:email)
  should validate_presence_of(:telefone)
  should validate_presence_of(:profissao)
  should validate_presence_of(:endereco)
  should validate_uniqueness_of(:email)

  def setup
    @c = customers(:one)
  end

  test "se customer possui parâmetro 'nome'" do
    assert_respond_to @c, :nome
  end

  test "se customer possui parâmetro 'telefone'" do
    assert_respond_to @c, :telefone
  end

  test "se customer possui parâmetro 'email'" do
    assert_respond_to @c, :email
  end

  test "se customer possui parâmetro 'dispositivo'" do
    assert_respond_to @c, :dispositivo
  end

  test "se customer possui parâmetro 'price'" do
    assert_respond_to @c, :price
  end

  test "se customer possui parâmetro 'profissao'" do
    assert_respond_to @c, :profissao
  end

  test "se customer possui parâmetro 'endereco'" do
    assert_respond_to @c, :endereco
  end

  test "se é válido com todos os atributos" do
    assert @c.valid?
  end

  test "se é válido com atributos 'nome', 'email', 'telefone', 'profissao' e 'endereco'" do
    @c.dispositivo = nil
    @c.price = nil
    assert @c.valid?
  end
end

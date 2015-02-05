require 'test_helper'

class CustomersTest < ActionDispatch::IntegrationTest
  def fill_form(c)
    fill_in :customer_nome, with: c.nome
    fill_in :customer_email, with: c.email
    fill_in :customer_telefone, with: c.telefone
    fill_in :customer_endereco, with: c.endereco
    fill_in :customer_profissao, with: c.profissao
  end

  test "acesso à home page" do
    visit "/"
    
    assert_equal root_path, current_path
    within("h2.slogan-title") do
      assert has_content? 'Você tem coragem para ter o salão mais conhecido e rentável da cidade?'
    end
  end

  test "submissão formulário vazio" do
    run_browser
    
    visit "/"
    page.execute_script("$('.form-control.small').prop('required', false)")
    click_button "Sim! Quero Cadastrar Agora!"
    click_button "Eu Quero mais Clientes AGORA!"

    within("div.error") do
      assert has_content? "Preencha todos os campos"
    end
  end

  test "submissão do formulário com dados válidos" do
    run_browser
    c = customers(:one)

    visit "/"
    click_button "Sim! Quero Cadastrar Agora!"
    fill_form(c)
    click_button "Eu Quero mais Clientes AGORA!"

    # Dando pau porque redirecionamento é feito via AJAX
    # e o método assert_redirected_to analisa o código de
    # retorno - o qual não existe e um erro
    # "undefined method `response_code' for nil:NilClass"
    # é retornado 
    assert_redirected_to obrigado_path
    within("h3.title") do
      assert has_content? "Obrigado"
    end
  end

  test "se preço premium é salvo" do
    run_browser
    c = customers(:one)

    visit "/"
    find_link('premium').click
    assert_equal find("#customer_price", :visible => false).value, '67'

    find_link('restrito').click
    assert_equal find("#customer_price", :visible => false).value, '37'

    find_button('sem_preco').click
    assert_equal find("#customer_price", :visible => false).value, '00'
  end
end


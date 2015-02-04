require 'test_helper'

class CustomersTest < ActionDispatch::IntegrationTest
  test "acesso à home page" do
    visit "/"
    
    assert_equal root_path, current_path
    within("h2.slogan-title") do
      assert has_content? 'Você tem coragem para ter o salão mais conhecido e rentável da cidade?'
    end
  end

  test "submissão formulário vazio" do # deve testar ausência dos três parâmetros
    run_browser
    
    visit "/"
    page.execute_script("$('.form-control.small').prop('required', false)")
    click_button "Teste Grátis por 2 Meses"
    click_button "Eu Quero 2 Meses Grátis!"

    within("div.error") do
      assert has_content? "Preencha todos os campos"
    end
  end

  test "submissão do formulário com dados válidos" do
    run_browser
    c = customers(:one)

    visit "/"
    click_button "Teste Grátis por 2 Meses"
    fill_in :customer_nome, with: c.nome
    fill_in :customer_email, with: c.email
    fill_in :customer_telefone, with: c.telefone
    fill_in :customer_endereco, with: c.endereco
    fill_in :customer_profissao, with: c.profissao
    click_button "Eu Quero 2 Meses Grátis"

    assert_redirected_to obrigado_path
    within("h3.title") do
      assert has_content? "Obrigado"
    end
  end
end


require 'minitest/metadata'

class AcceptanceTest < MiniTest::Spec
  include MiniTest::Metadata
  include Capybara::DSL

  before do
    if metadata[:js] == true
      #Capybara.current_driver = Capybara.javascript_driver
      Capybara.current_driver = :selenium
    end
  end

  after do
    Capybara.current_driver = Capybara.default_driver
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

end
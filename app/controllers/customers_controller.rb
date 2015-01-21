class CustomersController < ApplicationController
  def new
    logger.info "***AGENT: #{request.user_agent}"
    @customer = Customer.new
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      finished("prices", reset: false)
      redirect_to @customer, notice: 'Customer was successfully created.'
    else
      render :new
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:nome, :email, :telefone, :dispositivo)
    end
end
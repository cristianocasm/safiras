class CustomersController < ApplicationController
  def new
    logger.info "***AGENT: #{request.user_agent}"
    @customer = Customer.new
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    @customer.save

    respond_to do |format|
      format.js { render "modal_response" }
    end
  end

  def obrigado
  end

  def google8346493cd4fccd96
    render :layout => false
  end

  def track_video_played
    finished(:video_position)
    respond_to do |format|
      format.js { head :ok }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:nome, :email, :telefone, :dispositivo, :price, :profissao, :endereco)
    end
end
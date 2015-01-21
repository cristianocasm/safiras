module CustomersHelper
  @@prices = {
    low: {indiv: '39,90', basic: '69,90', busin: '99,90', empire: '139,90'},
    medium: {indiv: '49,90', basic: '79,90', busin: '109,90', empire: '159,90'},
    high: {indiv: '59,90', basic: '99,90', busin: '139,90', empire: '199,90'}
  }

  def get(price, plan)
    @@prices[price.to_sym][plan.to_sym]
  end

end

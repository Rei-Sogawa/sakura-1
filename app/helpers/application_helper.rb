module ApplicationHelper
  def sub_total(product_counting_models)
    product_counting_models.inject(0) do |sum, product_counting_model|
      sum + product_counting_model.product_count * product_counting_model.product.price
    end
  end

  def cash_on_delivery(product_counting_models)
    case sub_total(product_counting_models)
    when 0..9_999
      300
    when 10_000..29_999
      400
    when 30_000..100_000
      600
    when 100_000..nil
      1000
    end
  end

  def postage(product_counting_models)
    600 + 600 * (product_counting_models.map(&:product_count).sum / 5)
  end

  def total(product_counting_models)
    without_tax = sub_total(product_counting_models) +
                  cash_on_delivery(product_counting_models) +
                  postage(product_counting_models)
    (without_tax * 1.1).to_i
  end
end

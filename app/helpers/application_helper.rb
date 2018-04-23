module ApplicationHelper

  def render_date(date)
    date.strftime("%b %e, %Y")
  end

  def format_price(price)
    if price.nil?
      price = 0
    end

    "$" + format("%.2f", price/100)
  end


end

module ApplicationHelper
  def cents_to_dollar(cents)
    number_to_currency(cents / 100.0)
  end

  def order_date(date)
    date.strftime("%m/%d/%Y %I:%M%p")
  end

  def all_categories
    Category.all
  end

  def cart_full?
    @cart.contents != {}
  end

  def formatted_address
    "#{@order.user.street_address}, #{@order.user.city}, #{@order.user.state} - #{@order.user.zip_code}"
  end

  def formatted_name
    "#{@order.user.first_name} #{@order.user.last_name}"
  end
end

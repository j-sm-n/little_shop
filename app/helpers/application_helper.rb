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

<<<<<<< HEAD
  def path_based_on_role
    if current_admin?
      admin_dashboard_path
    else
      dashboard_path
    end
=======
  def cart_full?
    @cart.contents != {}
>>>>>>> development
  end
end

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

  def path_based_on_role
    if current_admin?
      admin_dashboard_path
    else
      dashboard_path
    end
  end
end

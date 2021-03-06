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

  def cart_full?
    @cart.contents != {}
  end

  def formatted_address(user)
    "#{user.street_address}, #{user.city}, #{user.state} #{user.zip_code}"
  end

  def formatted_name(user)
    "#{user.first_name} #{user.last_name}"
  end

  def can_recommend_items(item)
    current_user && current_user.item_recommender.recommended_items(item)
  end

  def no_recommended_items(item)
    !current_user.item_recommender.recommended_items(item)
  end
end

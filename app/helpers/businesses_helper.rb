module BusinessesHelper
  def can_send_message?(business)
    current_business && current_business != business
  end
end

module ApplicationHelper
  def using_analytics?
    APP_CONFIG["google_analytics"] 
  end
end

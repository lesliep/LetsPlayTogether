module ApplicationHelper

  def alert_classes alert_type
    alert = {
      :success => "alert-success",
      :error => "alert-error",
      :alert => "alert-warning"
    }[alert_type] || "alert-info"

    "alert #{alert} alert-dismissible"
  end
end

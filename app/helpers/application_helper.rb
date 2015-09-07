module ApplicationHelper

  def bootstrap_flash
    bootstrap_flash_for = { success: "alert-success", error: "alert-danger", errors: "alert-danger", alert: "alert-warning", notice: "alert-info" }
    flash.each do |msg_type, message|
      msg_type = msg_type.to_sym
      concat(content_tag(:div, message, class: "alert #{bootstrap_flash_for[msg_type]} alert-dismissible", role: 'alert') do
        concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }) do
          concat content_tag(:span, 'Close', class: 'sr-only')
        end)
        if flash[:errors].present?
          message.each do |word|
            concat "<div class='alert alert-danger alert-dismissible'>#{word}</div>".html_safe
          end
        else
          concat message
        end
      end)
    end
    nil
  end

  def active_menu?(controller, *actions)
    if actions.include?(params[:action].to_sym) || actions.include?(:all)
      return 'active'
    end if controller_name == controller.to_s
  end

end

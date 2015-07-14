module ApplicationHelper

	def resource_name
    :user
  end

  def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end

  def magicfy(value)
    content_tag(:i, value, class: 'fa fa-minus')
  end

  def magicfy1(value)
    content_tag(:i, value, class: 'fa fa-times')
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def full_title(page_title)                          # Определение метода
    base_title = "TaskMe удобный сервис по поиску исполнителей"  # Назначение переменной
    if page_title.empty?                              # Булевый тест
      base_title                                      # Явное возвращение
    else
      "#{base_title} / #{page_title}"                 # Интерполяция строки
    end
  end
end

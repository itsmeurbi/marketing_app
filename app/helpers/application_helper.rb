# frozen_string_literal: true

module ApplicationHelper
  def flash_class(category)
    case category
    when 'notice' then 'notification is-primary'
    when 'success' then 'notification is-danger'
    else 'notification is-danger'
    end
  end

  def message_author_class(message)
    if current_user == message.user
      'is-author'
    else
      ''
    end
  end
end

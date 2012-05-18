module MessagingHelpers
  def message_name ( page_name )
    case page_name

    when /a long (.+) name/
      'is too long'
    when /a short (.+) name/
      'is too short'
    when /a blank (.+) name/
      'can\'t be blank'
    end
  end
end

World(MessagingHelpers)

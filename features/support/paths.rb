module NavigationHelpers
  def path_to ( page_name )
    case page_name

    when /home\s?page/
      '/'
    when /sign_in/
      '/sign_in'
    end
  end
end

World(NavigationHelpers)

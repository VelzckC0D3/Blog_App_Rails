module UsersHelper
  def user_details_for(user)
    content_tag(:div, class: 'user-helper') do
      concat(content_tag(:p, user.name.to_s, class: 'user-helper-name'))
      concat(content_tag(:p, "Total Posts: #{user.posts_counter}", class: 'user-helper-total-posts'))
    end
  end
end

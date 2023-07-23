module UsersHelper
  def user_details_for(user)
    content_tag(:div, class: 'userInfo') do
      concat(content_tag(:p, user.name.to_s, class: 'userName'))
      concat(content_tag(:p, "Total Posts: #{user.posts_counter}", class: 'totalPosts'))
    end
  end
end

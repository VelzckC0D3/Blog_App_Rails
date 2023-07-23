module PostsHelper
  def render_text_section(post)
    content_tag(:div, class: 'text') do
      concat content_tag(:p, "Comments: #{post.comments_counter.nil? ? 0 : post.comments_counter}",
                         class: 'comment-text')
      concat content_tag(:p, "Likes: #{post.likes_counter.nil? ? 0 : post.likes_counter}")
    end
  end

  def render_comments_section(post)
    content_tag(:ul, class: 'commentsCont') do
      if post.comments.blank?
        concat content_tag(:li, 'No comments yet', class: 'comments')
      else
        post.recent_comments.each do |comment|
          concat content_tag(:li, "Username: #{comment.text.blank? ? 'no comments for the moment' : comment.text}",
                             class: 'comments')
        end
      end
    end
  end
end

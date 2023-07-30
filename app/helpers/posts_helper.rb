module PostsHelper
  def render_text_section(post)
    content_tag(:div, class: 'posts_helper_actions') do
      content_tag(:p, "Comments: #{post.comments_counter.nil? ? 0 : post.comments_counter}",
                  class: 'posts-helper-comments') <<
        link_to('Likes: ', increment_likes_path(post), method: :post, remote: true, class: 'posts-helper-like') <<
        content_tag(:span, post.likes_counter.nil? ? 0 : post.likes_counter, class: 'posts-helper-like')
    end
  end

  def render_comments_section(post)
    content_tag(:ul, class: 'posts-helper-cont') do
      content_tag(:h4, 'Recent Comments:', class: 'posts-helper-comments') <<
        if post.comments.blank?
          content_tag(:li, 'no comments yet...', class: 'posts-helper-comment')
        else
          post.recent_comments.map do |comment|
            content_tag(:li, "#{User.find(comment.author_id).name}: #{comment.text.downcase}",
                        class: 'posts-helper-comment')
          end.join.html_safe
        end
    end
  end

  def render_comments_show(post)
    content_tag(:div, class: 'posts-helper-cont') do
      content_tag(:h4, 'All Comments:', class: 'posts-helper-comments') <<
        if post.comments.blank?
          content_tag(:p, 'no comments yet...', class: 'posts-helper-comment')
        else
          post.recent_comments.map do |comment|
            content_tag(:div, class: 'posts-helper-comment') do
              content_tag(:div, class: 'posts-helper-actions') do
                content_tag(:h4, "#{User.find(comment.author_id).name}:", class: 'posts-helper-name') +
                  if user_signed_in? && (comment.author_id == current_user.id or can?(:manage, :all))
                    button_to('Delete', user_comment_path(user_id: post.user.id, id: comment.id),
                              method: :delete, data: { turbo_method: :delete, turbo_confirm: 'Delete Comment?' },
                              class: 'posts-helper-delete submit-btn')
                  end
              end +
                content_tag(:p, comment.text.downcase.to_s, class: 'posts-helper-text')
            end
          end.join.html_safe
        end
    end
  end
end

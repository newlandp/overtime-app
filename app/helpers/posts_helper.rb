module PostsHelper
  def edit_disabled? post
    if post.submitted?
      link_to 'Edit', edit_post_path(post.id), id: "edit_#{post.id}"
    else
      link_to 'Edit', edit_post_path(post.id), id: "edit_#{post.id}", class: "disabled"
    end
  end

  def status_label status
    status_span_generator status
  end

  private

  def status_span_generator status
    case status
    when 'submitted'
      content_tag(:span, status.titleize, class: "badge badge-primary")
    when 'approved'
      content_tag(:span, status.titleize, class: "badge badge-success")
    when 'rejected'
      content_tag(:span, status.titleize, class: "badge badge-danger")
    end
  end
end

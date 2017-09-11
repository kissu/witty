module ApplicationHelper

  def button_new_article
    if policy(Article).new?
      link_to '<i class="fa fa-plus green-lg" aria-hidden="true"></i>'.html_safe, new_article_path(@article)
    end
  end

  def button_edit_article(article)
    if policy(article).update?
      link_to '<i class="fa fa-pencil"></i>'.html_safe, edit_article_path(article)
    end
  end

  def button_destroy_article(article)
    if policy(article).destroy?
      link_to '<i class="fa fa-trash"></i>'.html_safe, article_path(article), method: :delete
    end
  end

  def button_external_link(article)
    link_to '<i class="fa fa-external-link"></i>'.html_safe, article.url, target: "_blank"
  end

end

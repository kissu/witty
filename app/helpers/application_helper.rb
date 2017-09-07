module ApplicationHelper

  def button_new_article
    if policy(Article).new?
      link_to "Write your publication", new_article_path(@article), class: "btn btn-primary"
    end
  end

  def button_edit_article(article)
    if policy(article).update?
      link_to edit_article_path(article) do
        '<i class="fa fa-pencil"></i>'.html_safe
      end
    end
  end

  def button_destroy_article(article)
    if policy(article).destroy?
      link_to article_path(article) do
        '<i class="fa fa-trash"></i>'.html_safe
      end
    end
  end
end

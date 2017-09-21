module ApplicationHelper

# ----------------------- ARTICLE SIDE -----------------------
  def button_new_article
    if policy(Article).new?
      link_to 'Add a link'.html_safe, new_article_path, class: "green-button"
    end
  end

  def button_edit_article(article)
    if policy(article).update?
      link_to '<i class="fa fa-pencil"></i>'.html_safe, edit_article_path(article)
    end
  end

  def button_destroy_article(article)
    if policy(article).destroy?
      link_to '<i class="fa fa-trash red-trash"></i>'.html_safe, article_path(article),
        method: :delete, data: { confirm: "Are you sure?" }
    end
  end

  def button_external_link(article)
    if policy(article).share?
      link_to '<i class="fa fa-share"></i>'.html_safe, article.url,
        target: "_blank", id: "btn-share"
    end
  end

# ----------------------- CONTACT SIDE -----------------------
  def button_new_contact
    if policy(Contact).new?
      link_to '<i class="fa fa-plus"></i>'.html_safe, new_contact_path
    end
  end

  def button_edit_contact(contact)
    if policy(contact).update?
      link_to '<i class="fa fa-pencil"></i>'.html_safe, edit_contact_path(contact)
    end
  end

  def button_destroy_contact(contact)
    if policy(contact).destroy?
      link_to '<i class="fa fa-trash red-trash"></i>'.html_safe, contact_path(contact),
        method: :delete, data: { confirm: "Are you sure?" }
    end
  end

  def button_ask_intro(contact)
    if policy(contact).ask_intro?
      link_to "Demander une intro", "#", class: "dropdown-toggle ask-intro",
       "data-toggle" => "dropdown"
    end
  end

# ----------------------- OTHER STUFF -----------------------
  def button_new_invitation(user)
    if policy(user).send_invitation?
      link_to 'Nouvel utilisateur', new_user_invitation_path,
        class: "btn btn-success"
    end
  end

  def button_send_reporting(user)
    if policy(user).send_reporting?
      link_to "Send your report", '#',
        class: "dropdown-toggle navbar-wagon-link",
        id:"navbar-wagon-menu", "data-toggle" => "dropdown"
    end
  end

end

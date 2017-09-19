module ApplicationHelper

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
      link_to '<i class="fa fa-trash"></i>'.html_safe, article_path(article), method: :delete
    end
  end

  def button_external_link(article)
    link_to '<i class="fa fa-share"></i>'.html_safe, article.url, target: "_blank", id: "btn-share"
  end

  def button_new_invitation
    link_to 'Nouvel utilisateur', new_user_invitation_path, class: "btn btn-success"
  end

  def ask_for_contact(contact)
    mail_to "florent.merian@aquiti.fr", subject: "Demande de mise en relation", class: "ask-intro",
    body: "Bonjour,\n
    Je souhaite rencontrer cette personne:\n
     #{contact.title}.
     #{contact.description}\n

    Pour rappel, notre activité :
      Solution :......
      Marché visé :.......\n
    Nos derniers indicateurs :
      Chiffre d’affaires mensuel : .....€
      Nombre de clients : ....#
      Taux de satisfaction : .....%\n
    Merci
    Bonne journée," do
          "Demander une intro"
          end
  end
end

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
        method: :delete
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
        method: :delete
    end
  end

  def ask_for_contact(contact)
    if policy(contact).ask_intro?
      mail_to "florent.merian@aquiti.fr",
      subject: "Demande de mise en relation",
      class: "ask-intro",
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

# ----------------------- OTHER STUFF -----------------------
  def button_new_invitation
    link_to 'Nouvel utilisateur', new_user_invitation_path,
      class: "btn btn-success"
  end

  def send_reporting
    mail_to "florent.merian@aquiti.fr",
    subject: "Reporting",
    class: "",
    body: "Bonjour,\n
      Nos derniers indicateurs :
          Chiffre d’affaires mensuel : €
          Dépenses mensuelles : €
          Trésorerie disponible à date : €
          Nombre de clients : #
          Taux de conversion lead -- client : %
          Taux de satisfaction client : %\n
      Mes besoins :
          Une nouvelle offre d’emploi
          Une mise en relation avec un de nos experts
          Un conseil particulier ?\n
      Quelques informations diverses :
          Un nouveau cas client ? une récente publication ? Une interview ?
          Bonne nouvelle ou mauvaise nouvelle ;
          Peu importe, nous sommes à votre écoute\n
      Merci\n
      Bonne journée," do
          'Send your report'
          end
  end
end

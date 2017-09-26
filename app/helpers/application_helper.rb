module ApplicationHelper

  def button_edit(element)
    if policy(element).update?
      object_in_string = element.class.to_s.downcase
      link_to '<i class="fa fa-pencil"></i>'.html_safe,
        eval("edit_#{object_in_string}_path(element)")
    end
  end

  def button_destroy(element)
    if policy(element).destroy?
      object_in_string = element.class.to_s.downcase
      link_to '<i class="fa fa-trash red-trash"></i>'.html_safe,
        eval("#{object_in_string}_path(element)"),
        method: :delete, data: { confirm: "Are you sure?" }
    end
  end

  # ----------------------- ARTICLE SIDE -----------------------
  def button_new_article
    if policy(Article).new?
      link_to 'Add a link'.html_safe, new_article_path, class: "green-button"
    end
  end

  def button_external_link(article)
    if policy(article).share?
      link_to '<i class="fa fa-share"></i>'.html_safe, article.url,
        target: "_blank", id: "btn-share"
    end
  end

  def button_featured(article)
    if policy(article).featured?
      link_to '<i class="fa fa-star" aria-hidden="true"></i>'.html_safe,
      featured_article_path(article)
    end
  end

# ----------------------- CONTACT SIDE -----------------------
  def button_new_contact
    if policy(Contact).new?
      link_to '<i class="fa fa-plus"></i>'.html_safe, new_contact_path
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
#------------------------ MAILING ------------------------
  def send_reporting(user)
    if policy(user).send_reporting?
      mail_to "florent.merian@aquiti.fr", subject: "Reporting", class: "navbar-wagon-link",
      body: "Bonjour,\n
        Nos derniers indicateurs :
            Chiffre d’affaires mensuel : ....€
            Dépenses mensuelles : ....€
            Trésorerie disponible à date : ....€
            Nombre de clients : ....#
            Taux de conversion lead -- client : .....%
            Taux de satisfaction client : ....%\n
        Mes besoins :
            Une nouvelle offre d’emploi?
            Une mise en relation avec un de nos experts?
            Un conseil particulier ?\n
        Quelques informations diverses :
            Un nouveau cas client ? une récente publication ? Une interview ?
            Bonne nouvelle ou mauvaise nouvelle ;
            Peu importe, nous sommes à votre écoute\n
        Merci,\n
        Bonne journée," do
            "Send your report"
            end
    end
  end

  def ask_intro(contact)
    if policy(contact).ask_intro?
      mail_to "florent.merian@aquiti.fr", subject: "Demande de mise en relation", class: "",
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
end

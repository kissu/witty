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
        target: "_blank", class: "btn-share"
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
      link_to 'ADD A CONTACT', new_contact_path, class: "green-button"
    end
  end

  def button_ask_intro(contact)
    if policy(contact).ask_intro?
      link_to "Ask an intro", ask_intro_contact_path(contact),
        class: "btn btn-success btn-sm ask-intro"
    end
  end

  def button_shuffle
    if policy(Contact).shuffle?
      link_to "Shuffle", "#shuffled", id: "shuffle", class: "green-button"
    end
  end
# ----------------------- OTHER STUFF -----------------------
  def button_new_invitation(user)
    if policy(user).send_invitation?
      link_to 'New user', new_user_invitation_path,
        class: "call-to-action"
    end
  end

  def button_send_reporting(user)
    if policy(user).send_reporting?
      link_to "Send your report", reporting_path, class: "call-to-action"
    end
  end

  def link_onboarding(user)
    if policy(user).link_onboarding?
      link_to "Onboarding", onboarding_path
    end
  end

  def link_sign_out(user)
    if policy(user).link_onboarding?
      link_to "Log out", destroy_user_session_path, method: :delete
    end
  end

  def link_admin(user)
    if policy(user).link_admin?
      link_to "Admin interface", admin_root_path
    end
  end

  def choose_action_of_button(button)
    if policy(User).choose_action_of_button? && current_page?(contacts_path)
        html = "<p class='text-left'>New user to add to Witty ? <b>Invite him/her.</b></p>".html_safe
        html += button_new_contact
    elsif button == 'shuffle'
      html = "<p class='text-left'>In some shaky mood ? <b>Click me !</b></p>".html_safe
      html += button_shuffle
    else
      html = "<p class='text-left'>Seen an awesome article recently ? <b>Submit it.</b></p>".html_safe
      html += button_new_article
    end
  end

#------------------------ MAILING ------------------------
  # def send_reporting(user)
  #   if policy(user).send_reporting?
  #     "Bonjour,\n
  #       Nos derniers indicateurs :
  #           Chiffre d’affaires mensuel : ....€
  #           Dépenses mensuelles : ....€
  #           Trésorerie disponible à date : ....€
  #           Nombre de clients : ....#
  #           Taux de conversion lead -- client : .....%
  #           Taux de satisfaction client : ....%\n
  #       Mes besoins :
  #           Une nouvelle offre d’emploi?
  #           Une mise en relation avec un de nos experts?
  #           Un conseil particulier ?\n
  #       Quelques informations diverses :
  #           Un nouveau cas client ? une récente publication ? Une interview ?
  #           Bonne nouvelle ou mauvaise nouvelle ;
  #           Peu importe, nous sommes à votre écoute\n
  #       Merci,\n
  #       Bonne journée,"
  #   end
  # end

  # def ask_intro(contact)
  #   if policy(contact).ask_intro?
  #     mail_to "florent.merian@aquiti.fr", subject: "Demande de mise en relation",
  #     class: "btn btn-success btn-sm",
  #     body: "Bonjour,\n
  #     Je souhaite rencontrer cette personne:\n
  #       #{contact.title}.
  #       #{contact.description}\n
  #     Pour rappel, notre activité :
  #       Solution :......
  #       Marché visé :.......\n
  #     Nos derniers indicateurs :
  #       Chiffre d’affaires mensuel : .....€
  #       Nombre de clients : ....#
  #       Taux de satisfaction : .....%\n
  #     Merci
  #     Bonne journée," do
  #           "Demander une intro"
  #           end
  #   end
  # end
end

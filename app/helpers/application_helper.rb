module ApplicationHelper

  def button_new_article
    if policy(Article).new?
      link_to 'Add a Link'.html_safe, new_article_path(@article), class: "navbar-wagon-link"
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

  def send_reporting
    mail_to "florent.merian@aquiti.fr", subject: "Reporting", class: "badge",
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
          "<i class='fa fa-bolt'></i>".html_safe
          end
  end
end

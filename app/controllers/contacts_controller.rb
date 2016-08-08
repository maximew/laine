class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      redirect_to(contacts_url, success: 'Votre message a bien été envoyé, merci de nous avoir contacté.')
    else
      if params[:contact].present?
        redirect_to(contacts_url, danger: 'Veuillez renseigner tous les champs du formulaire.')
      else
        redirect_to(contacts_url, danger: 'Une erreur est survenue lors de l\'envoie du message.')
      end
    end
  end
end
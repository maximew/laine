class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:success] = 'Votre message a bien été envoyé, merci de nous avoir contacté.'
    else
      flash.now[:danger] = 'Une erreur est survenue lors de l\'envoie du message.'
      render :new
    end
  end
end
class Contact < MailForm::Base
  attribute :firstname, :validate => true
  attribute :lastname,  :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Contact - Lainé Fermetures",
      :to => "maxime.warnault@gmail.com",
      :from => %("#{firstname} #{lastname}" <#{email}>)
    }
  end
end
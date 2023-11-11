class ContactMailer < ApplicationMailer
  
  def send_mail(contact, user)
    @contact = contact
    @user = user
    mail to:   user.email, subject: '【お問い合わせ】' + @contact.subject
  end
  
end

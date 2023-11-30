class ContactMailer < ApplicationMailer
  
  def send_mail(contact, user)
    @contact = contact
    @user = user
    mail to:   user.email, subject: '【お問い合わせ】' + @contact.subject
  end
  
  # def contact_mail(contact, user)
  #   @contact = contact
  #   mail to: user.email, bcc: ENV["ACTION_MAILER_USER"], subject: "お問い合わせについて【自動送信】"
  # end
  
  # def send_mail(contact)
  #   @contact = contact
  #   mail(from: contact.email, to: ENV['MAIL_ADDRESS'], subject: 'Webサイトよりお問い合わせが届きました') do |format|
  #     format.text
  #   end
  # end
  
end

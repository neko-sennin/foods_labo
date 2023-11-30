class ContactMailer < ApplicationMailer
  
  def send_mail(contact, user)
    @contact = contact
    @user = user
    mail to: user.email, subject: "お問い合わせについて【自動送信】"
  end
  
  def contact_mail(contact, user)
    @contact = contact
    @user = user
    mail(to: ENV['SMTP_USERNAME'], subject: 'Webサイトよりお問い合せが届きました')
  end
  
  def reply_mail(contact, user)
    @contact = contact
    @user = user
    mail to: user.email, subject: "お問い合わせの回答"
  end
  
end

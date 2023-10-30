class ContactMailer < ApplicationMailer
  
  def send_mail(contact)
    @contact = contact
    mail to: user.email, bcc: ENV["TOMAIL"], subject: "お問い合わせについて【自動送信】"
  end
  
end

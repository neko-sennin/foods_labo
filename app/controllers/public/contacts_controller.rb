class Public::ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end
  
  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end
  
  def back
    @contact = Contact.new(contact_params)
    render :new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact, current_user).deliver_now
      ContactMailer.contact_mail(@contact, current_user).deliver_now
      redirect_to root_path, flash: {success: "お問い合せが完了しました。"}
    else
      flash.now[:danger] = "お問い合せ内容に不備があります。"
      render :new
    end
  end
  
  private
  
  def contact_params
    params.require(:contact).permit(:user_id, :subject, :message)
  end
  
end

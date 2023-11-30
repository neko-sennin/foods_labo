class Admin::ContactsController < ApplicationController
	
	def index
	  @contacts = Contact.page(params[:page]).order(created_at: :desc).per(16)
	end
	
	def show
		@contact = Contact.find(params[:id])
	end
	
	def edit
		@contact = Contact.find(params[:id])
	end

	def update
	  contact = Contact.find(params[:id]) #contact_mailer.rbの引数を指定
	  contact.update(contact_params)
	  user = contact.user
	  ContactMailer.reply_mail(user, contact).deliver_now #確認メールを送信
	  redirect_to root_path, flash: {success: "返信が完了しました。"}
	end

	def destroy
		contact = Contact.find(params[:id])
		contact.destroy
		@contacts = Contact.page(params[:page]).order(created_at: :desc).per(16)
		@users = User.all
		render :index
	end

	private
	def contact_params
		params.require(:contact).permit(:user_id, :subject, :message, :reply)
	end
	
end

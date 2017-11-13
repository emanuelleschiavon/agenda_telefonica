class ContactsController < ApplicationController

	before_action :set_contact, only: [:destroy, :edit, :update, :show]

	def index
		@contacts = Contact.includes(:group).order(:name)
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new contact_params
		if @contact.save
			flash[:notice] = "Contact was successfully created."
			redirect_to root_url
		else
			renderiza :new
		end
	end

	def edit
		renderiza :edit
	end

	def update
		if @contact.update contact_params
			flash[:notice] = "Contact was successfully updated."
			redirect_to root_url
		else
			renderiza :edit
		end
	end

	def destroy
		@contact.destroy
		redirect_to root_url
	end

	def show
		@group = Group.find(@contact.group_id)
	end

	private
	def set_contact
		@contact = Contact.find(params[:id])
	end

	def renderiza(view)
		@contacts = Contact.all
		render view
	end

	def contact_params
		params.require(:contact).permit(:name, :telephone, :email, :group_id)
	end

end

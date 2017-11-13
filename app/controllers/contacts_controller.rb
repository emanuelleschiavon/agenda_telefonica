class ContactsController < ApplicationController

	before_action :set_contact, only: [:destroy, :edit, :update]

	def index
		@contacts = Contact.order(:name)
	end

	def new
		@contact = Contact.new
		@groups = Group.all
		renderiza :new
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
		@groups = Group.all
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

	def find
		@name = params[ :name ]
		@contacts = Contact.where "name like ?", "%#{@name}%"
	end

	def show
		set_contact
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
		params.require(:contact)
		.permit(:name, :telephone, :email, :group_id)
	end

end

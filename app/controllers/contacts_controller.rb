class ContactsController < ApplicationController

  before_action :require_logged_in_user

  def index
    @contacts = current_user.contacts
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def edit
    @contact = current_user.contacts.find_by(id: params[:id])
    if @contact.nil?
      flash[:danger] = 'Contact not found.'
      redirect_to contacts_path(current_user)
    end
  end

  def create
    @contact = current_user.contacts.build(contact_params)
    if @contact.save
      flash[:success] = 'Contato successfuly created.'
      redirect_to contacts_path
    else
      render 'new'
    end
  end

  def update
    @contact = current_user.contacts.find(params[:id])
    if @contact.update(contact_params)
      flash[:success] = 'Contat successfuly updated'
      redirect_to contacts_path
    else
      render 'edit'
    end
  end

  def destroy
    @contact = current_user.contacts.find(params[:id])
    if @contact.destroy
      flash[:success] = 'Contat successfuly deleted'
      redirect_to contacts_path
    else
      flash[:danger] = 'Contact not found.'
      redirect_to contacts_path(current_user)
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :phone)
    end
end

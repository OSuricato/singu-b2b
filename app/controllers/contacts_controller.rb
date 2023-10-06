class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @solutions = Solution.all
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      # Handle a successful save.
    else
      render 'new'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :company, :cnpj, :phone_number, :email, :message, solution_ids: [])
  end
end

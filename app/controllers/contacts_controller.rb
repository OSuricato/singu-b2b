class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @solutions = Solution.all
  end

  def create
    require 'hubspot-api-client'

    api_client = Hubspot::Client.new(access_token: ENV['HUBSPOT_ACCESS_TOKEN'])

    properties = {
      "email": params[:contact][:email],
      "phone": params[:contact][:phone_number],
      "company": params[:contact][:company],
      "website": "b3glytics.net",
      "lastname": params[:contact][:last_name],
      "firstname": params[:contact][:first_name],
      "cnpj": params[:contact][:cnpj]
      # add any other properties you want to set here
    }
    body = { associations: [], properties: properties }

    begin
      api_response = api_client.crm.contacts.basic_api.create(body: body)
      flash[:notice] = 'Contato recebido com sucesso!.'
    rescue StandardError => e
      if e.message.include?("already exists")
        flash[:error] = 'Esse email já foi registrado.'
      else
        flash[:error] = 'Ocorreu um erro ao criar o contato.'
        puts "Exception when calling ContactsApi->create: #{e}"
      end
    end

    redirect_to new_contact_path # This will redirect the user back to the form page.
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :company, :cnpj, :phone_number, :email, :message, solution_ids: [])
  end
end

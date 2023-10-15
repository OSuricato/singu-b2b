class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @solutions = Solution.all
  end

  def create
    require 'hubspot-api-client'

    api_client = Hubspot::Client.new(access_token: ENV['HUBSPOT_ACCESS_TOKEN'])

    properties = {
      "email": "vitao@biglytics.net",
      "phone": "(833) 929-0687",
      "company": "B3glytics",
      "website": "b3glytics.net",
      "lastname": "Bartbosa",
      "firstname": "Victor"
      # add any other properties you want to set here
    }
    body = { associations: [], properties: properties }

    api_response = api_client.crm.contacts.basic_api.post_crm_v3_objects_contacts(body: body)
    puts api_response
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :company, :cnpj, :phone_number, :email, :message, solution_ids: [])
  end
end

class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @solutions = Solution.all
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      # Create a contact in HubSpot
      require 'net/http'
      require 'uri'
      require 'json'

      uri = URI.parse("https://api.hubapi.com/contacts/v1/contact")
      request = Net::HTTP::Post.new(uri)
      request["Authorization"] = "Bearer #{ENV['HUBSPOT_PRIVATE_APP_KEY']}"
      request["Content-Type"] = "application/json"
      request.body = JSON.dump({
        "properties" => [
          {
            "property" => "email",
            "value" => @contact.email
          },
          {
            "property" => "firstname",
            "value" => @contact.first_name
          },
          {
            "property" => "lastname",
            "value" => @contact.last_name
          }
          # Add any other contact properties here
        ]
      })

      req_options = {
        use_ssl: uri.scheme == "https",
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

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

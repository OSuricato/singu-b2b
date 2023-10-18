class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @solutions = Solution.all
  end

  def create
    require 'hubspot-api-client'

    api_client = Hubspot::Client.new(access_token: ENV['HUBSPOT_ACCESS_TOKEN'])

    # Convert checkbox values to 'true' or 'false'
    checkbox_params = %i[voucher_singu assinatura_singu corporativo_singu residencial_singu eventos_singu dia_especial_singu]

    checkbox_params.each do |param|
      params[:contact][param] = params[:contact][param] == '1' ? 'true' : 'false'
    end

    properties = {
      "email": params[:contact][:email],
      "phone": params[:contact][:phone_number],
      "company": params[:contact][:company],
      "message": params[:contact][:message],
      "lastname": params[:contact][:last_name],
      "firstname": params[:contact][:first_name],
      "cnpj": params[:contact][:cnpj],
      "voucher_singu": params[:contact][:voucher_singu],
      "assinatura_singu": params[:contact][:assinatura_singu],
      "corporativo_singu": params[:contact][:corporativo_singu],
      "residencial_singu": params[:contact][:residencial_singu],
      "eventos_singu": params[:contact][:eventos_singu],
      "dia_especial_singu": params[:contact][:dia_especial_singu]
    }
    body = { associations: [], properties: properties }

    begin
      api_response = api_client.crm.contacts.basic_api.create(body: body)

      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:notices, partial: 'shared/notice', locals: { notice: 'Mensagem enviada com sucesso' })
        end
        format.html { redirect_to new_contact_path, notice: 'Contato recebido com sucesso!' }
      end
    rescue StandardError => e
      if e.message.include?('already exists')
        flash[:error] = 'Esse email já foi registrado.'
      else
        flash[:error] = 'Ocorreu um erro ao criar o contato.'
        puts "Exception when calling ContactsApi->create: #{e}"
      end

      redirect_to new_contact_path
    end
  end



  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :company, :cnpj, :phone_number, :email, :message, solution_ids: [])
  end
end

class Contact < ApplicationRecord
  has_and_belongs_to_many :solutions

  # validates :first_name, :last_name, :company, :phone_number, :message, presence: true
  # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :cnpj, format: { with: /\A\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}\z/ }
end

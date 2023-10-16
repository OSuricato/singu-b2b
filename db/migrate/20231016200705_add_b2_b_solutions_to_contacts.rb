class AddB2BSolutionsToContacts < ActiveRecord::Migration[7.0]
  def change
    add_column :contacts, :voucher_singu, :boolean
    add_column :contacts, :assinatura_singu, :boolean
    add_column :contacts, :corporativo_singu, :boolean
    add_column :contacts, :residencial_singu, :boolean
    add_column :contacts, :eventos_singu, :boolean
    add_column :contacts, :dia_especial_singu, :boolean
  end
end

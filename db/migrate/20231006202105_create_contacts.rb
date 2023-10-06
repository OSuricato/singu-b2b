class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :cnpj
      t.string :phone_number
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end

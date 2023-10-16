class AddImageToSolutions < ActiveRecord::Migration[7.0]
  def change
    add_column :solutions, :image, :string
  end
end

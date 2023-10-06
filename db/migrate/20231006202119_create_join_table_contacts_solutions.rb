class CreateJoinTableContactsSolutions < ActiveRecord::Migration[7.0]
  def change
    create_join_table :contacts, :solutions do |t|
      # t.index [:contact_id, :solution_id]
      # t.index [:solution_id, :contact_id]
    end
  end
end

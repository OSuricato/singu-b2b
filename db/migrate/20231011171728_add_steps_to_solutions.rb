class AddStepsToSolutions < ActiveRecord::Migration[7.0]
  def change
    add_column :solutions, :step_1, :text
    add_column :solutions, :step_2, :text
    add_column :solutions, :step_3, :text
    add_column :solutions, :step_4, :text
  end
end

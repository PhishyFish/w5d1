class AddVisibilityAndCompletionToGoals < ActiveRecord::Migration[5.1]
  def change
    add_column :goals, :visibility, :boolean, default: true
    add_column :goals, :completion, :boolean, default: false
    change_column :goals, :details, :text, null: true
  end
end

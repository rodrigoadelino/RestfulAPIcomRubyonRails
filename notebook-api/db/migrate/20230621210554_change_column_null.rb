class ChangeColumnNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :contacts, :kind_id, true
  end
end

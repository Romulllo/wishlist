class AddPriorityToWish < ActiveRecord::Migration[6.0]
  def change
    add_column :wishes, :priority, :interger, defaut: 0
  end
end

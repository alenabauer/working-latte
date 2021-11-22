class AddIsCafeOwnerToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_cafe_owner, :boolean, :default => false
  end
end

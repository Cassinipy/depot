class AddForeignKeyPayTypes < ActiveRecord::Migration[6.1]
  def change
    rename_column :pay_types, :pay_types, :pay_type
    remove_column :orders, :pay_type
    add_reference :orders, :pay_type, foreign_key: true
  end
end

class CreatePayTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :pay_types do |t|
      t.string :pay_types

      t.timestamps
    end
  end
end
